<h4> Identification of Phenotypic Clusters in Flow Cytometry Data </h4>
This project focuses on the identification and characterization of phenotypic clusters in flow cytometry summary data. The main goal is to detect groups of samples with similar cellular composition and describe their biological phenotypes based on gated cell populations.
The analysis was performed across several experiments, with the same general pipeline applied to each dataset.

<h4> Project overview </h4>
Flow cytometry data contain multiple gated cell populations representing different immune, progenitor, erythroid, and myeloid cell subsets. In this project, these populations were used as features for unsupervised clustering.

The main objectives were to:

--> preprocess flow cytometry summary data,

--> normalize selected cell populations to the percentage of live cells,

--> reduce dimensionality using PCA and UMAP,

--> identify clusters using DBSCAN,

--> characterize each cluster based on enriched and depleted cell populations,

--> interpret clusters as biologically meaningful phenotypic states.


<h4> Input data </h4>
The input data consist of flow cytometry summary tables. Each row represents a sample or event summary, while selected columns correspond to gated cell populations.

Examples of analyzed cell populations include: monocytes, neutrophils,cKit-positive progenitors,GMP populations,erythroid lineage populations, CD71-positive subsets,Ter119-related subsets, FcR-positive and FcR-negative populations, CD150/CD105 quadrants, non-myeloid populations.

<h4> Analysis pipeline </h4>
The analysis pipeline consists of the following steps:

1. Loading flow cytometry summary data.

2. Selecting relevant gated cell population columns.

3. Normalizing selected populations as percentages of live cells.

4. Replacing missing values with zero.

5. Performing dimensionality reduction using PCA.

6. Applying UMAP for two-dimensional visualization.

7. Detecting clusters using DBSCAN.

8. Characterizing clusters using z-scores, Shannon diversity, and top enriched/depleted features.
   
9. Interpreting clusters based on their phenotypic profiles.

<h4> Data preprocessing </h4>
Selected cytometry columns were normalized using the live-cell gate as the denominator:
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
  
Missing values were replaced with zero before downstream analysis.

<h4> Dimensionality reduction </h4>
Principal Component Analysis was used to reduce the dimensionality of the normalized cytometry data. The explained variance was calculated for each principal component.
UMAP was then applied to visualize the structure of the dataset in two dimensions.
The UMAP representation was used to inspect phenotypic separation between samples and to support cluster detection.

<h4> Clustering </h4>
Clusters were detected using DBSCAN. The eps parameter was selected based on the k-nearest-neighbor distance plot.
For example, in one analysis, the 5-nearest-neighbor distance plot suggested an eps value around 0.5.
DBSCAN was chosen because it can identify clusters with irregular shapes and does not require predefining the number of clusters.

<h4> Cluster characterization </h4>
Each cluster was characterized using:
cluster size, mean values of normalized cell populations, standard deviation, z-score profiles, Shannon diversity index, enriched cell populations, depleted cell populations, biological interpretation.

The z-score was calculated as:
zscore <- function(x, mean, sd) {
  (x - mean) / sd
}
The Shannon diversity index was calculated as:
shannon_index <- function(x) {
  x <- x[x > 0]
  p <- x / sum(x)
  -sum(p * log(p))
}
