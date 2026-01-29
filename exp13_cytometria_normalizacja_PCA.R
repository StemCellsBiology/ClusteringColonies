library(readxl)
library(dplyr)
library(writexl)
library(dplyr)
setwd("~/Desktop/Szade_Lab/aktualne")

# lista kolumn cytometrycznych 
cyto_cols <- c(
  "all_events",
  "singlets_cells",
  "Live_dead_Ly6C_subset",
  "FSC_A_medium_SSC_A_high",
  "FSC_low.SSC_low",
  "FSChigh_SSChigh",
  "FSClow_SSC_high",
  "SSC_low_FSC_high",
  "cKit_neg",
  "low6C_mono",
  "CD16_32neg_CD71hi",
  "Ter119neg_CD105pos",
  "Ter119pos_CD105pos",
  "Ter119pos_CD105neg",
  "Ter119neg_CD105neg",
  "CD16_32pos_CD71hi",
  "CD16_32neg_CD71pos",
  "CD16_32low_CD71low",
  "CD16_32neg_CD71neg",
  "monocytes_1",
  "FcR_hi",
  "FcR_low",
  "FcR_neg",
  "neutrophils",
  "non_mielo_wide",
  "Ter119_pos_CD16_32neg",
  "CD71high_Ter119neg",
  "CD71pos_Ter119low",
  "CD71pos_Ter119neg",
  "non_mielo",
  "early_baso",
  "late_baso",
  "polychrom",
  "proerythro",
  "Q1_CD150neg_CD105pos",
  "Q2_CD150pos_CD105pos",
  "Q3_CD150pos_CD105neg",
  "Q4_CD150neg_CD105neg",
  "cKit_pos",
  "CD150pos_CD16_32neg",
  "GMP_1",
  "GMP_2",
  "non_GMP",
  "CMP_1",
  "CFUE",
  "preCFUE",
  "preGM",
  "preMegE",
  "CD71pos_CD34neg",
  "CMP_1_CD71pos_CD105neg",
  "CMP_1_CD71pos_CD105pos",
  "CMP_2",
  "trombo"
)

# wczytanie danych
df <- read_excel("ERC_aim1_exp13_summary.xlsx") 

# OBIEKT R z samą cytometrią
df_cyto <- df %>%
  select(all_of(cyto_cols))

# normalizacja % of live dla wszystkich
denom <- "Live_dead_Ly6C_subset"
gate_cols <- setdiff(colnames(df_cyto), denom)

df_cyto_pct_live <- df_cyto %>%
  mutate(
    across(
      all_of(gate_cols),
      ~ ifelse(.data[[denom]] == 0 | is.na(.data[[denom]]), NA_real_, (.x / .data[[denom]]) * 100),
      .names = "{.col}_pct_live"
    )
  )

#normalizacja % of live dla zgatowanych populacji
gated_populations <- c(
  "low6C_mono",
  "monocytes_1",
  "CD16_32neg_CD71hi",
  "CD16_32pos_CD71hi",
  "CD16_32neg_CD71pos",
  "CD16_32low_CD71low",
  "CD16_32neg_CD71neg",
  "FcR_hi",
  "FcR_low",
  "FcR_neg",
  "neutrophils",
  "Ter119_pos_CD16_32neg",
  "CD71high_Ter119neg",
  "CD71pos_Ter119low",
  "CD71pos_Ter119neg",
  "early_baso",
  "late_baso",
  "polychrom",
  "proerythro",
  "Ter119neg_CD105pos",
  "Ter119pos_CD105pos",
  "Ter119pos_CD105neg",
  "Ter119neg_CD105neg",
  "Q1_CD150neg_CD105pos",
  "Q2_CD150pos_CD105pos",
  "Q3_CD150pos_CD105neg",
  "Q4_CD150neg_CD105neg",
  "CD150pos_CD16_32neg",
  "GMP_1",
  "GMP_2",
  "non_GMP",
  "CMP_1",
  "CMP_2",
  "CFUE",
  "preCFUE",
  "preGM",
  "preMegE",
  "CD71pos_CD34neg",
  "CMP_1_CD71pos_CD105neg",
  "CMP_1_CD71pos_CD105pos",
  "trombo"
)

denom <- "Live_dead_Ly6C_subset"
df_gated_pct_live <- df_cyto %>%
  mutate(
    across(
      all_of(gated_populations),
      ~ ifelse(
        .data[[denom]] == 0 | is.na(.data[[denom]]),
        NA_real_,
        (.x / .data[[denom]]) * 100
      ),
      .names = "{.col}_pct_live"
    )
  ) %>%
  select(ends_with("_pct_live"))

# HISTOGRAMY DLA WSZYSTKICH POPULACJI
library(ggplot2)
df_in <- df_gated_pct_live
out_dir <- file.path(getwd(), "exp_13_histograms_pct_live")
if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)

# Kolumny do histogramów (wszystkie % of live)
pct_cols <- grep("_pct_live$", colnames(df_in), value = TRUE)

if (length(pct_cols) == 0) {
  stop("Nie znaleziono kolumn kończących się na '_pct_live'")
}

# === HISTOGRAM LOOP ===
for (col in pct_cols) {
  p <- ggplot(df_in, aes(x = .data[[col]])) +
    geom_histogram(bins = 50) +
    labs(
      title = paste("Histogram:", col),
      x = "% of live",
      y = "Count"
    ) +
    theme_minimal()
  
  # nazwa pliku
  safe_name <- gsub("[^A-Za-z0-9_\\-]+", "_", col)
  
  ggsave(
    filename = file.path(out_dir, paste0(safe_name, ".png")),
    plot = p,
    width = 7,
    height = 5,
    dpi = 300
  )
}

message("Histogramy zapisane w: ", out_dir)

library(dplyr)
library(ggplot2)

############## PCA ############################
library(tidyr)
pca_mat <- df_gated_pct_live %>%
  mutate(across(everything(), ~ replace_na(.x, 0))) %>%
  as.matrix()

pca_res <- prcomp(
  log1p(pca_mat),
  center = TRUE,
  scale. = TRUE
)

var_explained <- (pca_res$sdev^2) / sum(pca_res$sdev^2) * 100
pca_df <- as.data.frame(pca_res$x) %>%
  mutate(
    PC1 = PC1,
    PC2 = PC2
  )

ggplot(pca_df, aes(x = PC1, y = PC2)) +
  geom_point(size = 3, alpha = 0.8) +
  labs(
    title = "PCA of gated populations (% of live)",
    subtitle = paste0(
      "PC1: ", round(var_explained[1], 1), "% | ",
      "PC2: ", round(var_explained[2], 1), "%"
    ),
    x = paste0("PC1 (", round(var_explained[1], 1), "%)"),
    y = paste0("PC2 (", round(var_explained[2], 1), "%)")
  ) +
  theme_minimal(base_size = 14)

#PORÓWNANIE DWÓCH METOD (jawny vs niejawny z-score)
####################
# wariant A (log1p) vs B (z-score) + porównanie
library(dplyr)
library(ggplot2)

#  Macierz wejściowa 
# df_gated_pct_live: tylko zgatowane populacje w % of live (kolumny *_pct_live)

pca_mat <- df_gated_pct_live %>%
  mutate(across(everything(), ~ ifelse(is.na(.x), 0, .x))) %>%
  as.matrix()

# log1p(%live)
X <- log1p(pca_mat)

# A) Baseline: z-score robiony "w środku" prcomp przez scale.=TRUE
pca_A <- prcomp(X, center = TRUE, scale. = TRUE)

# B) Jawny Z-score przed PCA
Xz <- scale(X)  # kolumnowo: populacje
pca_B <- prcomp(Xz, center = FALSE, scale. = FALSE)

# czy scores są prawie identyczne?
cor_PC1 <- abs(cor(pca_A$x[,1], pca_B$x[,1]))
cor_PC2 <- abs(cor(pca_A$x[,2], pca_B$x[,2]))
print(paste0("abs(cor(PC1_A, PC1_B)) = ", round(cor_PC1, 6)))
print(paste0("abs(cor(PC2_A, PC2_B)) = ", round(cor_PC2, 6)))

# A vs B na jednym wykresie
df_plot <- bind_rows(
  as.data.frame(pca_A$x[,1:2]) %>% mutate(Method = "A: prcomp(scale.=TRUE)"),
  as.data.frame(pca_B$x[,1:2]) %>% mutate(Method = "B: scale() then prcomp()")
)

ggplot(df_plot, aes(x = PC1, y = PC2, shape = Method)) +
  geom_point(size = 3, alpha = 0.75) +
  labs(
    title = "PCA overlay: A vs B (log1p(% of live))",
    subtitle = paste0(
      "A: PC1 ", round(var_A[1],1), "% | PC2 ", round(var_A[2],1), "%  ||  ",
      "B: PC1 ", round(var_B[1],1), "% | PC2 ", round(var_B[2],1), "%"
    ),
    x = "PC1",
    y = "PC2"
  ) +
  theme_minimal(base_size = 14)
