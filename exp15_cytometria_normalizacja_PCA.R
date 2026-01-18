library(readxl)
library(dplyr)
library(writexl)
library(dplyr)
setwd("~/Desktop/Szade_Lab/aktualne")

cyto_cols <- c(
  "all_events",
  "singlets_cells",
  "Live_dead_Ly6C_subset",
  "cKit_neg",
  "low6c_mono",
  "monocytes_1",
  "neutrophils",
  "non_mielo",
  "FcR_neg",
  "CD150neg_CD105pos",
  "CD150pos_CD105pos",
  "CD150pos_CD105neg",
  "CD150neg_CD105neg",
  "cKit_pos",
  "GMP",
  "non_GMP",
  "CFU_E",
  "CMP",
  "preCFUE",
  "preGM",
  "preMegE",
  "trombo"
)

# wczytanie danych
df <- read_excel("ERC_aim1_exp15_summary.xlsx") 

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
  "cKit_neg",
  "low6c_mono",
  "monocytes_1",
  "neutrophils",
  "non_mielo",
  "FcR_neg",
  "CD150neg_CD105pos",
  "CD150pos_CD105pos",
  "CD150pos_CD105neg",
  "CD150neg_CD105neg",
  "cKit_pos",
  "GMP",
  "non_GMP",
  "CFU_E",
  "CMP",
  "preCFUE",
  "preGM",
  "preMegE",
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
out_dir <- file.path(getwd(), "exp_15_histograms_pct_live")
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
library(dplyr)
library(tidyr)

pca_df_in <- df_gated_pct_live
pca_mat <- pca_df_in %>%
  mutate(across(everything(), ~ replace_na(.x, 0))) %>%
  as.matrix()

keep_cols <- apply(pca_mat, 2, function(x) var(x, na.rm = TRUE) > 0)
pca_mat2 <- pca_mat[, keep_cols, drop = FALSE]

dropped <- colnames(pca_mat)[!keep_cols]
message("Wyrzucone kolumny (zero variance): ", paste(dropped, collapse = ", "))

pca_res <- prcomp(
  log1p(pca_mat2),
  center = TRUE,
  scale. = TRUE
)

var_explained <- (pca_res$sdev^2) / sum(pca_res$sdev^2) * 100
pca_scores <- as.data.frame(pca_res$x)
library(ggplot2)
pca_df <- as.data.frame(pca_res$x)

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
