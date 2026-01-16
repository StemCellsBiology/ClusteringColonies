library(readxl)
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
  "non_mielo_wide",
  "Ter119_pos_CD16_32neg",
  "CD71high_Ter119neg",
  "CD71pos_Ter119low",
  "CD71pos_Ter119neg",
  "low6c_mono",
  "CD16_32pos_CD71hi",
  "CD16_32neg_CD71pos",
  "CD16_32neg_CD71neg",
  "CD16_32neg_CD71hi",
  "Ter119neg_CD105pos",
  "Ter119pos_CD105pos",
  "Ter119pos_CD105neg",
  "Ter119neg_CD105neg",
  "CD16_32low_CD71low",
  "neutrophils",
  "monocytes_1",
  "FcR_hi",
  "FcR_low",
  "FcR_neg",
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
  "CD71pos_CD34neg",
  "CMP_1_CD71pos_CD105pos",
  "CMP_1_CD71pos_CD105neg",
  "CFUE",
  "preCFUE",
  "preGM",
  "preMegE",
  "CMP_2",
  "trombo"
)

# wczytanie danych
df <- read_excel("ERC_aim1_exp9_summary.xlsx")

# OBIEKT R z samą cytometrią
df_cyto <- df %>%
  select(all_of(cyto_cols))

# normalizacja % of live dla wszystkich
library(dplyr)
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

# normalizacja % of live dla zgatowanych populacji
gated_populations <- c(
  "low6c_mono",
  "neutrophils",
  "monocytes_1",
  "early_baso",
  "late_baso",
  "polychrom",
  "proerythro",
  "trombo",
  "GMP_1",
  "GMP_2",
  "CMP_1",
  "CMP_2",
  "CFUE",
  "preCFUE",
  "preGM",
  "preMegE"
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
out_dir <- file.path(getwd(), "histograms_pct_live")
if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)

# Kolumny do histogramów (wszystkie % of live)
pct_cols <- grep("_pct_live$", colnames(df_in), value = TRUE)

if (length(pct_cols) == 0) {
  stop("Nie znaleziono kolumn kończących się na '_pct_live'. Sprawdź nazwę obiektu albo etap normalizacji.")
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


