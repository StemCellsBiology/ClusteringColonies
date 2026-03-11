# **Data Normalization: Index Sorting**


## **Checking if data is linear or log**

<details>
<summary><strong>ERC_aim1_exp9_summary</strong></summary>

``` r
library(readxl)

df_9 <- read_excel("ERC_aim1_exp9_summary.xlsx")
marker_cols_9 <- grep("_Median$", colnames(df_9), value = TRUE)

hist(df_9[[marker_cols_9[1]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_9[1])

hist(df_9[[marker_cols_9[2]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_9[2])

hist(df_9[[marker_cols_9[3]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_9[3])

hist(df_9[[marker_cols_9[4]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_9[4])
```

<img src="index_sorting1_files/figure-commonmark/cell-2-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-2-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-2-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-2-output-4.png"
width="420" height="420" />

Log10 transformation

``` r
log_data_1 <- log10(df_9[[marker_cols_9[1]]])
log_data_2 <- log10(df_9[[marker_cols_9[2]]])
log_data_3 <- log10(df_9[[marker_cols_9[3]]])

hist(log_data_1,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_9[1], ")"))

hist(log_data_2,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_9[2], ")"))

hist(log_data_3,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_9[3], ")"))
```

<img src="index_sorting1_files/figure-commonmark/cell-3-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-3-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-3-output-3.png"
width="420" height="420" />

</details>

<details>
<summary><strong>ERC_aim1_exp15_summary</strong></summary>

``` r
df_15 <- read_excel("ERC_aim1_exp15_summary.xlsx")
marker_cols_15 <- grep("_Median$", colnames(df_15), value = TRUE)
df_15[marker_cols_15] <- lapply(df_15[marker_cols_15], function(x) {
  as.numeric(gsub(",", ".", x))
})


hist(df_15[[marker_cols_15[1]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_15[1])

hist(df_15[[marker_cols_15[2]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_15[2])

hist(df_15[[marker_cols_15[3]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_15[3])

hist(df_15[[marker_cols_15[4]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_15[4])
```

<img src="index_sorting1_files/figure-commonmark/cell-4-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-4-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-4-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-4-output-4.png"
width="420" height="420" />

Log10 transformation

``` r
log_data_1 <- log10(df_15[[marker_cols_15[1]]])
log_data_2 <- log10(df_15[[marker_cols_15[2]]])
log_data_3 <- log10(df_15[[marker_cols_15[3]]])

hist(log_data_1,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_15[1], ")"))

hist(log_data_2,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_15[2], ")"))

hist(log_data_3,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_15[3], ")"))
```

<img src="index_sorting1_files/figure-commonmark/cell-5-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-5-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-5-output-3.png"
width="420" height="420" />

</details>

<details>
<summary><strong>ERC_aim1_exp13_summary</strong></summary>

``` r
library(readxl)
df_13 <- read_excel("ERC_aim1_exp13_summary1.xlsx")
head(df_13)
```

    New names:
    • `` -> `...1`
    • `` -> `...103`
    • `` -> `...104`

A tibble: 6 × 104

| …1 \<chr\> | Row.names \<chr\> | mouse.ID \<dbl\> | well.ID \<chr\> | first_treatment.x \<chr\> | second_treatment.x \<chr\> | medium \<chr\> | time.point \<dbl\> | number.of.cells \<chr\> | diameter.1 \<chr\> | ⋯ ⋯ | Spectral.LIVE.DEAD.Fixable.Near.IR.Dead.Cell.Stain_Geo.Mean \<chr\> | Live_Median \<chr\> | Spectral.PE.CF594_Geo.Mean \<chr\> | CD135_Median \<chr\> | Spectral.PE.Cy7_Geo.Mean \<chr\> | sca1_Median \<chr\> | Spectral.PE_Geo.Mean \<chr\> | CD34_Median \<chr\> | …103 \<chr\> | …104 \<chr\> |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
| 6803_B1 | 6803_B1 | 6803 | B1 | NaCl | NaCl | woGCSF | 14 | NA | 0.71 | ⋯ | 14459.5990306741 | 14459.5990306741 | 10.8431695823717 | 10.8431695823717 | 85.8210354325341 | 85.8210354325341 | 150.568587063886 | 150.568587063886 | 50.0286461057523 | 50.0286461057523 |
| 6803_B11 | 6803_B11 | 6803 | B11 | NaCl | NaCl | GCSF | 14 | NA | 16072 | ⋯ | 16180.2182358131 | 16180.2182358131 | 1 | 1 | 85.8210354325341 | 85.8210354325341 | 518.613419183793 | 518.613419183793 | 112.403866377206 | 112.403866377206 |
| 6803_B4 | 6803_B4 | 6803 | B4 | NaCl | NaCl | woGCSF | 14 | NA | 0.6 | ⋯ | 16924.4913409337 | 16924.4913409336 | 1 | 1 | 51.1663426637609 | 51.1663426637609 | 973.377380903921 | 973.37738090392 | 26.0624731559679 | 26.0624731559679 |
| 6803_B5 | 6803_B5 | 6803 | B5 | NaCl | NaCl | woGCSF | 14 | NA | 0.98 | ⋯ | 16924.4913409337 | 16924.4913409336 | 1 | 1 | 1 | 1 | 620.824360719126 | 620.824360719125 | 64.06792005705 | 64.06792005705 |
| 6803_B6 | 6803_B6 | 6803 | B6 | NaCl | NaCl | woGCSF | 14 | NA | 42005 | ⋯ | 18938.4202733089 | 18938.4202733089 | 1 | 1 | 1 | 1 | 2392.79917342814 | 2392.79917342814 | 57.2548788435838 | 57.2548788435838 |
| 6803_B7 | 6803_B7 | 6803 | B7 | NaCl | NaCl | GCSF | 14 | NA | 44562 | ⋯ | 31765.3119745651 | 31765.3119745651 | 1 | 1 | 55.9818021451455 | 55.9818021451455 | 1089.20436973524 | 1089.20436973524 | 1 | 1 |

``` r
marker_cols_13 <- grep("_Median$", colnames(df_13), value = TRUE)
marker_cols_13

str(df_13[marker_cols_13[1]])

df_13[marker_cols_13] <- lapply(df_13[marker_cols_13], function(x) {
  as.numeric(gsub(",", ".", x))
})

hist(df_13[[marker_cols_13[1]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_13[1])

hist(df_13[[marker_cols_13[2]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_13[2])

hist(df_13[[marker_cols_13[3]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_13[3])

hist(df_13[[marker_cols_13[4]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_13[4])
```

1.  ‘Lin_Median’
2.  ‘CD150_Median’
3.  ‘CD48_Median’
4.  ‘CD16_32_Median’
5.  ‘CD105_Median’
6.  ‘CD71_Median’
7.  ‘cKit_Median’
8.  ‘GFP_Median’
9.  ‘Live_Median’
10. ‘CD135_Median’
11. ‘sca1_Median’
12. ‘CD34_Median’

<!-- -->

    tibble [361 × 1] (S3: tbl_df/tbl/data.frame)
     $ Lin_Median: chr [1:361] "1" "37.3478516439654" "1.33953209899922" "8.467093878" ...

<img src="index_sorting1_files/figure-commonmark/cell-7-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-7-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-7-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-7-output-6.png"
width="420" height="420" />

``` r
log_data_1 <- log10(df_13[[marker_cols_13[1]]])
log_data_2 <- log10(df_13[[marker_cols_13[2]]])
log_data_3 <- log10(df_13[[marker_cols_13[3]]])

hist(log_data_1,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_13[1], ")"))

hist(log_data_2,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_13[2], ")"))

hist(log_data_3,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_13[3], ")"))
```

<img src="index_sorting1_files/figure-commonmark/cell-8-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-8-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-8-output-3.png"
width="420" height="420" />

</details>

<details>
<summary><strong>Mateusz_summary</strong></summary>

``` r
library(readxl)
df_mat <- read_excel("Mateusz_summary.xlsx")
head(df_mat)
```

A tibble: 6 × 67

| Plate.x \<chr\> | Group.x \<chr\> | Treatment.x \<chr\> | Well.x \<chr\> | ID.x \<chr\> | ID_shortcut.x \<chr\> | Events \<dbl\> | Median \<dbl\> | Median.1 \<dbl\> | Median.2 \<dbl\> | ⋯ ⋯ | GMP_2 \<dbl\> | GMP_combined \<dbl\> | non_GMP \<dbl\> | CMP_1 \<dbl\> | trombo \<dbl\> | FSC.A_medium_SSC.A_high \<dbl\> | FSC_low_SSC_low \<dbl\> | FSChigh_SSChigh \<dbl\> | FSClow_SSC_high \<dbl\> | SSC_low_FSC_high \<dbl\> |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
| P1 | Y_Neo_neg | Ntn_pos | B11 | Y_Neo_neg_Ntn_pos_P1_B11 | P1_B11 | 1 | 57.25488 | 97776.47 | 17309.37 | ⋯ | 510 | 953 | 40 | 40 | 0 | 53 | 3570 | 139 | 212 | 1244 |
| P1 | Y_Neo_neg | Ntn_neg | B3 | Y_Neo_neg_Ntn_neg_P1_B3 | P1_B3 | 1 | 143.94717 | 97776.47 | 23186.46 | ⋯ | 1622 | 7760 | 221 | 221 | 0 | 219 | 10312 | 3623 | 438 | 5168 |
| P1 | Y_Neo_neg | Ntn_pos | B7 | Y_Neo_neg_Ntn_pos_P1_B7 | P1_B7 | 1 | 93.89798 | 97776.47 | 20720.79 | ⋯ | 1526 | 4128 | 166 | 166 | 0 | 314 | 25609 | 1792 | 1987 | 3298 |
| P1 | Y_Neo_neg | Ntn_neg | C6 | Y_Neo_neg_Ntn_neg_P1_C6 | P1_C6 | 1 | 117.57433 | 97776.47 | 24253.01 | ⋯ | 53 | 625 | 8 | 8 | 0 | 116 | 12385 | 235 | 951 | 1662 |
| P1 | Y_Neo_neg | Ntn_pos | C9 | Y_Neo_neg_Ntn_pos_P1_C9 | P1_C9 | 1 | 96.03330 | 97776.47 | 16180.22 | ⋯ | 2 | 353 | 13 | 13 | 0 | 83 | 7475 | 448 | 376 | 646 |
| P1 | Y_Neo_neg | Ntn_neg | D2 | Y_Neo_neg_Ntn_neg_P1_D2 | P1_D2 | 1 | 65.52488 | 97776.47 | 22670.90 | ⋯ | 2833 | 7262 | 2435 | 2427 | 5 | 303 | 12837 | 1554 | 341 | 10434 |

``` r
marker_cols_mat <- grep("^Median", colnames(df_mat), value = TRUE)

str(df_mat[marker_cols_mat[1]])

df_mat[marker_cols_mat] <- lapply(df_mat[marker_cols_mat], function(x) {
  as.numeric(gsub(",", ".", x))
})

hist(df_mat[[marker_cols_mat[2]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_mat[2])

hist(df_mat[[marker_cols_mat[4]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_mat[4])

hist(df_mat[[marker_cols_mat[6]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_mat[6])

#all rows of these 3 columns have the same value=97776,47473
#we exclude them from further analysis as they do not give any biological information

marker_cols_mat <- marker_cols_mat[! marker_cols_mat %in% c('Median.1', 'Median.3', 'Median.5')]

hist(df_mat[[marker_cols_mat[1]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_mat[1])

hist(df_mat[[marker_cols_mat[2]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_mat[2])

hist(df_mat[[marker_cols_mat[3]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_mat[3])

hist(df_mat[[marker_cols_mat[4]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_mat[4])
```

    tibble [187 × 1] (S3: tbl_df/tbl/data.frame)
     $ Median: num [1:187] 57.3 143.9 93.9 117.6 96 ...

<img src="index_sorting1_files/figure-commonmark/cell-10-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-10-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-10-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-10-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-10-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-10-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-10-output-8.png"
width="420" height="420" />

``` r
log_data_1 <- log10(df_mat[[marker_cols_mat[1]]])
log_data_2 <- log10(df_mat[[marker_cols_mat[3]]])
log_data_3 <- log10(df_mat[[marker_cols_mat[5]]])

hist(log_data_1,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_mat[1], ")"))

hist(log_data_2,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_mat[3], ")"))

hist(log_data_3,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_mat[5], ")"))
```

<img src="index_sorting1_files/figure-commonmark/cell-11-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-11-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-11-output-3.png"
width="420" height="420" />

</details>

<details>
<summary><strong>RCSM_summary</strong></summary>

``` r
library(readxl)
df_rsm <- read_excel("RSM_summary.xlsx")
head(df_rsm)
```

    New names:
    • `` -> `...1`

A tibble: 6 × 78

| …1 \<chr\> | timepoint.x \<dbl\> | treatment.x \<chr\> | mice_ID.x \<chr\> | well.x \<chr\> | diameter_1 \<chr\> | diameter_2 \<dbl\> | diameter_3 \<dbl\> | mean_diameter_mm \<dbl\> | colony_shape \<chr\> | ⋯ ⋯ | subtype \<chr\> | composition.y \<chr\> | Neo1_Median \<dbl\> | CD150_Median \<dbl\> | Lin_Median \<dbl\> | cKit_Median \<dbl\> | CD48_Median \<dbl\> | Live_Median \<dbl\> | CD34_Median \<dbl\> | sca1_Median \<dbl\> |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
| 29_35_B4 | 1 | GCSF | 29_35 | B4 | 1160 | 1133 | 1143 | 1145.333 | dispersed | ⋯ | irregular | dark island | 1.00000 | 580.3258 | 3.36778 | 264.1648 | 1.00000 | 1.0000 | 33.37625 | 760.0801 |
| 29_35_B6 | 1 | GCSF | 29_35 | B6 | 1034 | 937 | 1056 | 1009.000 | compact | ⋯ | irregular | dark dots | 55.98180 | 795.0430 | 1.00000 | 404.9691 | 5.64876 | 869.8675 | 16.25315 | 664.1492 |
| 29_35_C11 | 1 | GCSF | 29_35 | C11 | 1338 | 1381 | 1311 | 1343.333 | compact | ⋯ | irregular | dark dots | 1.00000 | 395.9645 | 34.13525 | 180.2434 | 1.00000 | 1.0000 | 1.00000 | 1191.7135 |
| 29_35_C3 | 1 | GCSF | 29_35 | C3 | 1535 | 1539 | 1483 | 1519.000 | compact | ⋯ | irregular | dark dots | 14.52477 | 176.2356 | 1.00000 | 302.3213 | 1.00000 | 1.0000 | 21.28752 | 1165.2155 |
| 29_35_C4 | 1 | GCSF | 29_35 | C4 | 1465 | 1484 | 1474 | 1474.333 | compact | ⋯ | irregular | dark island | 1.00000 | 225.6917 | 100.45074 | 276.3161 | 1.00000 | 1.0000 | 1.00000 | 1113.9739 |
| 29_35_C5 | 1 | GCSF | 29_35 | C5 | 1353 | 1347 | 1349 | 1349.667 | compact | ⋯ | irregular | dark dots | 1.00000 | 387.1601 | 153.99265 | 361.9043 | 1.00000 | 1.0000 | 100.45074 | 433.2302 |

``` r
marker_cols_rsm <- grep("_Median$", colnames(df_rsm), value = TRUE)
marker_cols_rsm

str(df_rsm[marker_cols_rsm[1]])

df_rsm[marker_cols_rsm] <- lapply(df_rsm[marker_cols_rsm], function(x) {
  as.numeric(gsub(",", ".", x))
})

hist(df_rsm[[marker_cols_rsm[1]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_rsm[1])

hist(df_rsm[[marker_cols_rsm[2]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_rsm[2])

hist(df_rsm[[marker_cols_rsm[3]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_rsm[3])

hist(df_rsm[[marker_cols_rsm[4]]],
     breaks = 80,
     main = "Raw data",
     xlab = marker_cols_rsm[4])
```

1.  ‘Neo1_Median’
2.  ‘CD150_Median’
3.  ‘Lin_Median’
4.  ‘cKit_Median’
5.  ‘CD48_Median’
6.  ‘Live_Median’
7.  ‘CD34_Median’
8.  ‘sca1_Median’

<!-- -->

    tibble [624 × 1] (S3: tbl_df/tbl/data.frame)
     $ Neo1_Median: num [1:624] 1 56 1 14.5 1 ...

<img src="index_sorting1_files/figure-commonmark/cell-13-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-13-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-13-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-13-output-6.png"
width="420" height="420" />

log10

``` r
log_data_1 <- log10(df_rsm[[marker_cols_rsm[1]]])
log_data_2 <- log10(df_rsm[[marker_cols_rsm[2]]])
log_data_3 <- log10(df_rsm[[marker_cols_rsm[3]]])

hist(log_data_1,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_rsm[1], ")"))

hist(log_data_2,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_rsm[2], ")"))

hist(log_data_3,
     breaks = 50,
     main = "Log-transformed data",
     xlab = paste0("log10(", marker_cols_rsm[3], ")"))
```

<img src="index_sorting1_files/figure-commonmark/cell-14-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-14-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-14-output-3.png"
width="420" height="420" />

### As we can see after logarithm transformation the distirbution is way
better

</details>

## **Log transformation**

<details>
<summary><strong>Comparing log_10, ln, log1p and asinh</strong></summary>

#### Comparing for marker from ERC_aim1_exp_9

``` r
#log 10
df_log_9 <- df_9
df_log_9[marker_cols_9] <- log10(df_9[marker_cols_9])

hist(df_9[[marker_cols_9[8]]],
     breaks = 50,
     main = "before log - Raw data",
     xlab = marker_cols_9[8]
     )

hist(df_log_9[[marker_cols_9[8]]],
     breaks = 50,
     main = "after log10",
     xlab = paste0("log10(", marker_cols_9[8], ")")
     )

#ln
df_log_n <- df_9
df_log_n[marker_cols_9] <- log(df_9[marker_cols_9])


hist(df_log_n[[marker_cols_9[8]]],
     breaks = 50,
     main = "after log (natural)",
     xlab = paste0("log(", marker_cols_9[8], ")")
)

#log 1p
df_log_1p <- df_9
df_log_1p[marker_cols_9] <- log1p(df_9[marker_cols_9])


hist(df_log_1p[[marker_cols_9[8]]],
     breaks = 50,
     main = "after log 1p",
     xlab = paste0("log(", marker_cols_9[8], ")")
)

#asinh
df_log_asinh <- df_9
df_log_asinh[marker_cols_9] <- asinh(df_9[marker_cols_9] / 150)


hist(df_log_asinh[[marker_cols_9[8]]],
     breaks = 50,
     main = "after asinh",
     xlab = paste0("log(", marker_cols_9[8], ")")
)
```

<img src="index_sorting1_files/figure-commonmark/cell-15-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-15-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-15-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-15-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-15-output-5.png"
width="420" height="420" />

#### Comparing for marker from file ERC_aim1_exp15

``` r
#log_10
df_log_15 <- df_15
df_log_15[marker_cols_15] <- log10(df_15[marker_cols_15])

hist(df_15[[marker_cols_15[5]]],
     breaks = 50,
     main = "before log - Raw data",
     xlab = marker_cols_15[5]
     )

hist(df_log_15[[marker_cols_15[5]]],
     breaks = 50,
     main = "after log10",
     xlab = paste0("log10(", marker_cols_15[5], ")")
     )

#ln
df_log_n <- df_15
df_log_n[marker_cols_15] <- log(df_15[marker_cols_15])

hist(df_log_n[[marker_cols_15[5]]],
     breaks = 50,
     main = "after log (natural)",
     xlab = paste0("log(", marker_cols_15[5], ")")
)

#log 1p
df_log_1p <- df_15
df_log_1p[marker_cols_15] <- log1p(df_15[marker_cols_15])

hist(df_log_1p[[marker_cols_15[5]]],
     breaks = 50,
     main = "after log 1p",
     xlab = paste0("log(", marker_cols_15[5], ")")
)

#asinh
df_log_asinh <- df_15
df_log_asinh[marker_cols_15] <- asinh(df_15[marker_cols_15] / 150)

hist(df_log_asinh[[marker_cols_15[5]]],
     breaks = 50,
     main = "after asinh",
     xlab = paste0("log(", marker_cols_15[5], ")")
)
```

<img src="index_sorting1_files/figure-commonmark/cell-16-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-16-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-16-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-16-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-16-output-5.png"
width="420" height="420" />

We decide on using log_10 in furter analysis as it seem to work best

</details>

<details>
<summary><strong>Log_10 transformation ERC_aim1_exp_9</strong></summary>

``` r
for (m in marker_cols_9) {
  hist((df_log_9[[m]]),
       breaks = 80,
       main = paste("After log transformation:", m),
       xlab = paste0("log(", marker_cols_9[m], ")"))
}
```

<img src="index_sorting1_files/figure-commonmark/cell-17-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-17-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-17-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-17-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-17-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-17-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-17-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-17-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-17-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-17-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-17-output-11.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-17-output-12.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-17-output-13.png"
width="420" height="420" />


</details>

<details>
<summary><strong>Log_10 transformation ERC_aim1_exp_15</strong></summary>

``` r
for (m in marker_cols_15) {
  hist((df_log_15[[m]]),
       breaks = 80,
       main = paste("After log transformation:", m),
       xlab = paste0("log(", marker_cols_15[m], ")"))
}
```

<img src="index_sorting1_files/figure-commonmark/cell-18-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-18-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-18-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-18-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-18-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-18-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-18-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-18-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-18-output-9.png"
width="420" height="420" />

</details>

<details>
<summary><strong>Log_10 transformation ERC_aim1_exp_13</strong></summary>

``` r
df_log_13 <- df_13
df_log_13[marker_cols_13] <- log10(df_13[marker_cols_13])

for (m in marker_cols_13) {
  hist((df_log_13[[m]]),
       breaks = 80,
       main = paste("After log transformation:", m),
       xlab = paste0("log(", marker_cols_13[m], ")"))
}
```

<img src="index_sorting1_files/figure-commonmark/cell-19-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-19-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-19-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-19-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-19-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-19-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-19-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-19-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-19-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-19-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-19-output-11.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-19-output-12.png"
width="420" height="420" />

</details>

<details>
<summary><strong>Log_10 transformation Mateusz</strong></summary>


``` r
df_log_mat <- df_mat
df_log_mat[marker_cols_mat] <- log10(df_mat[marker_cols_mat])

for (m in marker_cols_mat) {
  hist((df_log_mat[[m]]),
       breaks = 80,
       main = paste("After log transformation:", m),
       xlab = paste0("log(", m, ")"))
}
```

<img src="index_sorting1_files/figure-commonmark/cell-20-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-20-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-20-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-20-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-20-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-20-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-20-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-20-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-20-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-20-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-20-output-11.png"
width="420" height="420" />

</details>

<details>
<summary><strong>Log_10 transformation RCSM</strong></summary>

``` r
df_log_rsm <- df_rsm
df_log_rsm[marker_cols_rsm] <- log10(df_rsm[marker_cols_rsm])

for (m in marker_cols_rsm) {
  hist((df_log_rsm[[m]]),
       breaks = 80,
       main = paste("After log transformation:", m),
       xlab = paste0("log(", m, ")"))
}
```

<img src="index_sorting1_files/figure-commonmark/cell-21-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-21-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-21-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-21-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-21-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-21-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-21-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-21-output-8.png"
width="420" height="420" />

</details>

## **Z-score scalling**

<details>
<summary><strong>scalling ERC_aim1_exp_9</strong></summary>

``` r
df_scaled_9 <- df_log_9
df_scaled_9[marker_cols_9] <- scale(df_log_9[marker_cols_9])
boxplot(df_scaled_9[marker_cols_9],
        main="log10 + z-score (scaled)",
        las=2)

hist(df_scaled_9[[marker_cols_9[8]]],
     breaks = 80,
     main = "after scalling",
     xlab = paste0("scale(", marker_cols_9[8], ")")
)
```

<img src="index_sorting1_files/figure-commonmark/cell-22-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-22-output-2.png"
width="420" height="420" />

``` r
for (m in marker_cols_9) {
  hist(df_9[[m]],
       breaks = 80,
       main = paste("Before normalization:", m),
       xlab = m)

  hist((df_scaled_9[[m]]),
       breaks = 80,
       main = paste("After scalling:", m),
       xlab = paste0("log(", m, ")"))
}
```

<img src="index_sorting1_files/figure-commonmark/cell-23-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-11.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-12.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-13.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-14.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-15.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-16.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-17.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-18.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-19.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-20.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-21.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-22.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-23.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-24.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-25.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-23-output-26.png"
width="420" height="420" />

</details>

<details>
<summary><strong>scalling ERC_aim1_exp_15</strong></summary>

``` r
df_scaled_15 <- df_log_15
df_scaled_15[marker_cols_15] <- scale(df_log_15[marker_cols_15])
boxplot(df_scaled_15[marker_cols_15],
        main="log10 + z-score (scaled)",
        las=2)

hist(df_scaled_15[[marker_cols_15[8]]],
     breaks = 80,
     main = "after scalling",
     xlab = paste0("scale(", marker_cols_15[8], ")")
)
```

<img src="index_sorting1_files/figure-commonmark/cell-24-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-24-output-2.png"
width="420" height="420" />

``` r
for (m in marker_cols_15) {
  hist(df_15[[m]],
       breaks = 80,
       main = paste("Before normalization:", m),
       xlab = m)

  hist((df_scaled_15[[m]]),
       breaks = 80,
       main = paste("After scalling:", m),
       xlab = paste0("log(", m, ")"))
}
```

<img src="index_sorting1_files/figure-commonmark/cell-25-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-11.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-12.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-13.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-14.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-15.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-16.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-17.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-25-output-18.png"
width="420" height="420" />

</details>

<details>
<summary><strong>scalling ERC_aim1_exp_13</strong></summary>

``` r
df_scaled_13 <- df_log_13
df_scaled_13[marker_cols_13] <- scale(df_log_13[marker_cols_13])
boxplot(df_scaled_13[marker_cols_13],
        main="log10 + z-score (scaled)",
        las=2)

#here we choose numeric columns and then replace all NA for zero
num_cols <- sapply(df_scaled_13, is.numeric)
df_scaled_13[, num_cols] <- lapply(df_scaled_13[, num_cols], function(x) {
  x[is.na(x) | is.infinite(x)] <- 0
  x
})

hist(df_scaled_13[[marker_cols_13[8]]],
     breaks = 80,
     main = "after scalling",
     xlab = paste0("scale(", marker_cols_13[8], ")")
)
```

<img src="index_sorting1_files/figure-commonmark/cell-26-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-26-output-2.png"
width="420" height="420" />

``` r
for (m in marker_cols_13) {
  hist(df_13[[m]],
       breaks = 80,
       main = paste("Before normalization:", m),
       xlab = m)

  hist((df_scaled_13[[m]]),
       breaks = 80,
       main = paste("After scalling:", m),
       xlab = paste0("log(", m, ")"))
}
```

<img src="index_sorting1_files/figure-commonmark/cell-27-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-11.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-12.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-13.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-14.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-15.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-16.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-17.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-18.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-19.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-20.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-21.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-22.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-23.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-27-output-24.png"
width="420" height="420" />

</details>

<details>
<summary><strong>scalling Mateusz</strong></summary>

``` r
df_scaled_mat <- df_log_mat
df_scaled_mat[marker_cols_mat] <- scale(df_log_mat[marker_cols_mat])
boxplot(df_scaled_mat[marker_cols_mat],
        main="log10 + z-score (scaled)",
        las=2)

#here we choose numeric columns and then replace all NA for zero
num_cols <- sapply(df_scaled_mat, is.numeric)
df_scaled_mat[, num_cols] <- lapply(df_scaled_mat[, num_cols], function(x) {
  x[is.na(x) | is.infinite(x)] <- 0
  x
})

hist(df_scaled_mat[[marker_cols_mat[8]]],
     breaks = 80,
     main = "after scalling",
     xlab = paste0("scale(", marker_cols_mat[8], ")")
)
```

<img src="index_sorting1_files/figure-commonmark/cell-29-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-29-output-2.png"
width="420" height="420" />

``` r
for (m in marker_cols_mat) {
  hist(df_mat[[m]],
       breaks = 80,
       main = paste("Before normalization:", m),
       xlab = m)

  hist((df_scaled_mat[[m]]),
       breaks = 80,
       main = paste("After scalling:", m),
       xlab = paste0("log(", m, ")"))
}
```

<img src="index_sorting1_files/figure-commonmark/cell-30-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-11.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-12.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-13.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-14.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-15.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-16.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-17.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-18.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-19.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-20.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-21.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-30-output-22.png"
width="420" height="420" />

</details>

<details>
<summary><strong>scalling RCSM</strong></summary>

``` r
df_scaled_rsm <- df_log_rsm
df_scaled_rsm[marker_cols_rsm] <- scale(df_log_rsm[marker_cols_rsm])
boxplot(df_scaled_rsm[marker_cols_rsm],
        main="log10 + z-score (scaled)",
        las=2)

#here we choose numeric columns and then replace all NA for zero
num_cols <- sapply(df_scaled_rsm, is.numeric)
df_scaled_rsm[, num_cols] <- lapply(df_scaled_rsm[, num_cols], function(x) {
  x[is.na(x) | is.infinite(x)] <- 0
  x
})

hist(df_scaled_rsm[[marker_cols_rsm[8]]],
     breaks = 80,
     main = "after scalling",
     xlab = paste0("scale(", marker_cols_rsm[8], ")")
)
```

<img src="index_sorting1_files/figure-commonmark/cell-31-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-31-output-2.png"
width="420" height="420" />

``` r
for (m in marker_cols_rsm) {
  hist(df_rsm[[m]],
       breaks = 80,
       main = paste("Before normalization:", m),
       xlab = m)

  hist((df_scaled_rsm[[m]]),
       breaks = 80,
       main = paste("After scalling:", m),
       xlab = paste0("log(", m, ")"))
}
```

<img src="index_sorting1_files/figure-commonmark/cell-32-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-11.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-12.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-13.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-14.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-15.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-32-output-16.png"
width="420" height="420" />

</details>

## **PCA**

<details>
<summary><strong>PCA ERC_aim1_exp_9</strong></summary>

``` r
pca_9 <- prcomp(df_scaled_9[marker_cols_9])
plot(pca_9$x[,1], pca_9$x[,2])
```

<img src="index_sorting1_files/figure-commonmark/cell-33-output-1.png"
width="420" height="420" />

``` r
pca_var_9 <- pca_9$sdev^2 # how much variation in the original data each principal component accounts for
pca_var_per_9 <- round(pca_var_9/sum(pca_var_9)*100,1)
pca_var_per_9
```

1.  20.1
2.  14.3
3.  12.2
4.  8.9
5.  8.2
6.  7.6
7.  7.2
8.  5.8
9.  4.6
10. 3.8
11. 2.9
12. 2.6
13. 1.7

``` r
barplot( pca_var_per_9, main = "scree plot", xlab = "principal component", ylab = "percent variation")
```

<img src="index_sorting1_files/figure-commonmark/cell-35-output-1.png"
width="420" height="420" />

slight difference beetwen 2 and 3, maybe PC1 vs PC3 or PC2 vs PC3?
delete outliers?

``` r
library(ggplot2)

pca_9.data <- data.frame(Sample = df_9$Row.names,
  X = pca_9$x[,1],
  Y = pca_9$x[,2])

ggplot(data = pca_9.data, aes(x = X, y = Y, label = Sample))+
  geom_point(size = 1)+
  xlab(paste("PC1 -", pca_var_per_9[1], "%", sep = ""))+
  ylab(paste("PC2 -", pca_var_per_9[2], "%", sep = ""))+
  theme_bw()+
  ggtitle("PCA graph")
```

<img src="index_sorting1_files/figure-commonmark/cell-36-output-1.png"
width="420" height="420" />

``` r
loading_scores_9 <- pca_9$rotation[,1]
marker_scores_9 <- abs(loading_scores_9)
markers_score_ranked_9 <- sort(marker_scores_9, decreasing = TRUE)
top_5_markers_9 <- names(markers_score_ranked_9[1:5])

top5_loadings_9 <- data.frame(
  Marker = top_5_markers_9,
  Loading = pca_9$rotation[top_5_markers_9, 1] #show the scores and sign (+/-)
)

top5_loadings_9
```

A data.frame: 5 × 2

| <!--/-->     | Marker \<chr\> | Loading \<dbl\> |
|--------------|----------------|-----------------|
| CD105_Median | CD105_Median   | 0.4524419       |
| GFP_Median   | GFP_Median     | 0.4398952       |
| CD150_Median | CD150_Median   | 0.4099102       |
| Live_Median  | Live_Median    | 0.3428536       |
| Lin_Median   | Lin_Median     | -0.2755929      |

</details>

<details>
<summary><strong>Applying z-score colours on PCA exp9</strong></summary>

``` r
library(dplyr)
library(tidyr)
library(ggplot2)

pca_9.data <- data.frame(
  Sample = rownames(df_9),
  X = pca_9$x[,1],
  Y = pca_9$x[,2]
)

plot_data <- pca_9.data %>%
  bind_cols(df_scaled_9[marker_cols_9]) %>%
  pivot_longer(
    cols = all_of(marker_cols_9),
    names_to = "Marker",
    values_to = "z_score"
  )

ggplot(plot_data, aes(x = X, y = Y, color = z_score)) +
  geom_point(size = 1) +
  scale_color_gradient2(
    low = "blue",
    mid = "white",
    high = "red",
    midpoint = 0
  ) +
  facet_wrap(~ Marker) +
  xlab(paste("PC1 -", pca_var_per_9[1], "%")) +
  ylab(paste("PC2 -", pca_var_per_9[2], "%")) +
  theme_bw() +
  ggtitle("PCA with z-score colours for all markers")
```


    Attaching package: ‘dplyr’


    The following objects are masked from ‘package:stats’:

        filter, lag


    The following objects are masked from ‘package:base’:

        intersect, setdiff, setequal, union

<img src="index_sorting1_files/figure-commonmark/cell-38-output-2.png"
width="420" height="420" />

``` r
for (marker in marker_cols_9) {
  pca_9.data$z_var9 <- df_scaled_9[[marker]]
  p <- ggplot(data = pca_9.data,
            aes(
              x = X,
              y = Y,
              label = Sample,
              color = z_var9)
          ) +
            scale_color_gradient2(
              low = "blue",
              mid = "white",
              high = "red",
              midpoint = 0,
              name = "z-score"
          ) +
            geom_point(size = 1)+
            xlab(paste("PC1 -", pca_var_per_9[1], "%", sep = ""))+
            ylab(paste("PC2 -", pca_var_per_9[2], "%", sep = ""))+
            theme_bw()+
            ggtitle(marker)
  print(p)
}
```

<img src="index_sorting1_files/figure-commonmark/cell-39-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-39-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-39-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-39-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-39-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-39-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-39-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-39-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-39-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-39-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-39-output-11.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-39-output-12.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-39-output-13.png"
width="420" height="420" />

</details>

<details>
<summary><strong>PCA ERC_aim1_exp_15</strong></summary>

``` r
pca_15 <- prcomp(df_scaled_15[marker_cols_15])
plot(pca_15$x[,1], pca_15$x[,2])
```

<img src="index_sorting1_files/figure-commonmark/cell-40-output-1.png"
width="420" height="420" />

``` r
pca_var_15 <- pca_15$sdev^2 # how much variation in the original data each principal component accounts for
pca_var_per_15 <- round(pca_var_15 / sum(pca_var_15)*100,1)
pca_var_per_15
```

1.  20.4
2.  17.2
3.  14.3
4.  11.2
5.  9.6
6.  8.6
7.  7.3
8.  5.9
9.  5.5

``` r
barplot( pca_var_per_15, main = "scree plot", xlab = "principal component", ylab = "percent variation")
```

<img src="index_sorting1_files/figure-commonmark/cell-42-output-1.png"
width="420" height="420" />

``` r
library(ggplot2)

pca_15.data <- data.frame(Sample = 1:nrow(df_15),
  X = pca_15$x[,1],
  Y = pca_15$x[,2])

ggplot(data = pca_15.data, aes(x = X, y = Y, label = Sample))+
  geom_point(size = 1)+
  xlab(paste("PC1 -", pca_var_per_15[1], "%", sep = ""))+
  ylab(paste("PC2 -", pca_var_per_15[2], "%", sep = ""))+
  theme_bw()+
  ggtitle("PCA graph")
```

<img src="index_sorting1_files/figure-commonmark/cell-43-output-1.png"
width="420" height="420" />

``` r
loading_scores_15 <- pca_15$rotation[,1]
marker_scores_15 <- abs(loading_scores_15)
markers_score_ranked_15 <- sort(marker_scores_15, decreasing = TRUE)
top_5_markers_15 <- names(markers_score_ranked_15[1:5])

top5_loadings_15 <- data.frame(
  Marker = top_5_markers_15,
  Loading = pca_15$rotation[top_5_markers_15, 1] #show the scores and sign (+/-)
)

top5_loadings_15
```

A data.frame: 5 × 2

| <!--/-->       | Marker \<chr\> | Loading \<dbl\> |
|----------------|----------------|-----------------|
| CD34_Median    | CD34_Median    | 0.4732188       |
| CD150_Median   | CD150_Median   | -0.4675962      |
| CD105_Median   | CD105_Median   | -0.4530575      |
| CD16_32_Median | CD16_32_Median | 0.3732949       |
| sca1_Median    | sca1_Median    | -0.2842991      |

</details>

<details>
<summary><strong>Applying z-score colours on PCA exp15</strong></summary>

``` r
library(dplyr)
library(tidyr)
library(ggplot2)

pca_15.data <- data.frame(
  Sample = rownames(df_15),
  X = pca_15$x[,1],
  Y = pca_15$x[,2]
)

plot_data <- pca_15.data %>%
  bind_cols(df_scaled_15[marker_cols_15]) %>%
  pivot_longer(
    cols = all_of(marker_cols_15),
    names_to = "Marker",
    values_to = "z_score"
  )

ggplot(plot_data, aes(x = X, y = Y, color = z_score)) +
  geom_point(size = 1) +
  scale_color_gradient2(
    low = "blue",
    mid = "white",
    high = "red",
    midpoint = 0
  ) +
  facet_wrap(~ Marker) +
  xlab(paste("PC1 -", pca_var_per_15[1], "%")) +
  ylab(paste("PC2 -", pca_var_per_15[2], "%")) +
  theme_bw() +
  ggtitle("PCA with z-score colours for all markers")
```

<img src="index_sorting1_files/figure-commonmark/cell-45-output-1.png"
width="420" height="420" />

``` r
for (marker in marker_cols_15) {
  pca_15.data$z_var15 <- df_scaled_15[[marker]]
  p <- ggplot(data = pca_15.data,
            aes(
              x = X,
              y = Y,
              label = Sample,
              color = z_var15)
          ) +
            scale_color_gradient2(
              low = "blue",
              mid = "white",
              high = "red",
              midpoint = 0,
              name = "z-score"
          ) +
            geom_point(size = 1)+
            xlab(paste("PC1 -", pca_var_per_15[1], "%", sep = ""))+
            ylab(paste("PC2 -", pca_var_per_15[2], "%", sep = ""))+
            theme_bw()+
            ggtitle(marker)
  print(p)
}
```

<img src="index_sorting1_files/figure-commonmark/cell-46-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-46-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-46-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-46-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-46-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-46-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-46-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-46-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-46-output-9.png"
width="420" height="420" />

</details>

<details>
<summary><strong>PCA ERC_aim1_exp_13</strong></summary>

``` r
pca_13 <- prcomp(df_scaled_13[marker_cols_13])
plot(pca_13$x[,1], pca_13$x[,2])
```

<img src="index_sorting1_files/figure-commonmark/cell-47-output-1.png"
width="420" height="420" />

``` r
pca_var_13 <- pca_13$sdev^2 # how much variation in the original data each principal component accounts for
pca_var_per_13 <- round(pca_var_13/sum(pca_var_13)*100,1)
pca_var_per_13
```

1.  21.8
2.  15
3.  12.4
4.  8.6
5.  8.1
6.  7.6
7.  6.7
8.  5.6
9.  4.2
10. 3.8
11. 3.5
12. 2.6

``` r
barplot( pca_var_per_13, main = "scree plot", xlab = "principal component", ylab = "percent variation")
```

<img src="index_sorting1_files/figure-commonmark/cell-49-output-1.png"
width="420" height="420" />

``` r
library(ggplot2)

pca_13.data <- data.frame(Sample = df_13$Row.names,
  X = pca_13$x[,1],
  Y = pca_13$x[,2])

ggplot(data = pca_13.data, aes(x = X, y = Y, label = Sample))+
  geom_point(size = 1)+
  xlab(paste("PC1 -", pca_var_per_13[1], "%", sep = ""))+
  ylab(paste("PC2 -", pca_var_per_13[2], "%", sep = ""))+
  theme_bw()+
  ggtitle("PCA graph")
```

<img src="index_sorting1_files/figure-commonmark/cell-50-output-1.png"
width="420" height="420" />

``` r
loading_scores_13 <- pca_13$rotation[,1]
marker_scores_13 <- abs(loading_scores_13)
markers_score_ranked_13 <- sort(marker_scores_13, decreasing = TRUE)
top_5_markers_13 <- names(markers_score_ranked_13[1:5])

top5_loadings_13 <- data.frame(
  Marker = top_5_markers_13,
  Loading = pca_13$rotation[top_5_markers_13, 1] #show the scores and sign (+/-)
)

top5_loadings_13
```

A data.frame: 5 × 2

| <!--/-->     | Marker \<chr\> | Loading \<dbl\> |
|--------------|----------------|-----------------|
| Live_Median  | Live_Median    | 0.5223301       |
| CD34_Median  | CD34_Median    | 0.4240742       |
| CD105_Median | CD105_Median   | 0.4217022       |
| CD150_Median | CD150_Median   | 0.3950798       |
| cKit_Median  | cKit_Median    | -0.2626954      |

</details>

<details>
<summary><strong>Applying z-score colours on PCA exp13</strong></summary>

``` r
library(dplyr)
library(tidyr)
library(ggplot2)

pca_13.data <- data.frame(
  Sample = rownames(df_13),
  X = pca_13$x[,1],
  Y = pca_13$x[,2]
)

plot_data <- pca_13.data %>%
  bind_cols(df_scaled_13[marker_cols_13]) %>%
  pivot_longer(
    cols = all_of(marker_cols_13),
    names_to = "Marker",
    values_to = "z_score"
  )

ggplot(plot_data, aes(x = X, y = Y, color = z_score)) +
  geom_point(size = 1) +
  scale_color_gradient2(
    low = "blue",
    mid = "white",
    high = "red",
    midpoint = 0
  ) +
  facet_wrap(~ Marker) +
  xlab(paste("PC1 -", pca_var_per_13[1], "%")) +
  ylab(paste("PC2 -", pca_var_per_13[2], "%")) +
  theme_bw() +
  ggtitle("PCA with z-score colours for all markers")
```

<img src="index_sorting1_files/figure-commonmark/cell-52-output-1.png"
width="420" height="420" />

``` r
for (marker in marker_cols_13) {
  pca_13.data$z_var13 <- df_scaled_13[[marker]]
  p <- ggplot(data = pca_13.data,
            aes(
              x = X,
              y = Y,
              label = Sample,
              color = z_var13)
          ) +
            scale_color_gradient2(
              low = "blue",
              mid = "white",
              high = "red",
              midpoint = 0,
              name = "z-score"
          ) +
            geom_point(size = 1)+
            xlab(paste("PC1 -", pca_var_per_13[1], "%", sep = ""))+
            ylab(paste("PC2 -", pca_var_per_13[2], "%", sep = ""))+
            theme_bw()+
            ggtitle(marker)
  print(p)
}
```

<img src="index_sorting1_files/figure-commonmark/cell-53-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-53-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-53-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-53-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-53-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-53-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-53-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-53-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-53-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-53-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-53-output-11.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-53-output-12.png"
width="420" height="420" />

</details>

<details>
<summary><strong>PCA Mateusz</strong></summary>

``` r
pca_mat <- prcomp(df_scaled_mat[marker_cols_mat])
plot(pca_mat$x[,1], pca_mat$x[,2])
```

<img src="index_sorting1_files/figure-commonmark/cell-54-output-1.png"
width="420" height="420" />

``` r
pca_var_mat <- pca_mat$sdev^2 # how much variation in the original data each principal component accounts for
pca_var_per_mat <- round(pca_var_mat/sum(pca_var_mat)*100,1)
pca_var_per_mat
```

1.  22.6
2.  15.3
3.  11
4.  10.3
5.  9.3
6.  7.6
7.  6.1
8.  5.5
9.  5
10. 4
11. 3.3

``` r
barplot(pca_var_per_mat, main = "scree plot", xlab = "principal component", ylab = "percent variation")
```

<img src="index_sorting1_files/figure-commonmark/cell-56-output-1.png"
width="420" height="420" />

``` r
library(ggplot2)

pca_mat.data <- data.frame(Sample = rownames(df_mat),
  X = pca_mat$x[,1],
  Y = pca_mat$x[,2])

ggplot(data = pca_mat.data, aes(x = X, y = Y, label = Sample))+
  geom_point(size = 1)+
  xlab(paste("PC1 -", pca_var_per_mat[1], "%", sep = ""))+
  ylab(paste("PC2 -", pca_var_per_mat[2], "%", sep = ""))+
  theme_bw()+
  ggtitle("PCA graph")
```

<img src="index_sorting1_files/figure-commonmark/cell-57-output-1.png"
width="420" height="420" />

``` r
loading_scores_mat <- pca_mat$rotation[,1]
marker_scores_mat <- abs(loading_scores_mat)
markers_score_ranked_mat <- sort(marker_scores_mat, decreasing = TRUE)
top_5_markers_mat <- names(markers_score_ranked_mat[1:5])

top5_loadings_mat <- data.frame(
  Marker = top_5_markers_mat,
  Loading = pca_mat$rotation[top_5_markers_mat, 1] #show the scores and sign (+/-)
)

top5_loadings_mat
```

A data.frame: 5 × 2

| <!--/-->  | Marker \<chr\> | Loading \<dbl\> |
|-----------|----------------|-----------------|
| Median.11 | Median.11      | 0.4642514       |
| Median.6  | Median.6       | 0.4500547       |
| Median.9  | Median.9       | 0.4106557       |
| Median.8  | Median.8       | -0.3995220      |
| Median    | Median         | 0.3068426       |

</details>

<details>
<summary><strong>Applying z-score colours on PCA Mateusz</strong></summary>

``` r
library(dplyr)
library(tidyr)
library(ggplot2)

pca_mat.data <- data.frame(
  Sample = rownames(df_mat),
  X = pca_mat$x[,1],
  Y = pca_mat$x[,2]
)

plot_data <- pca_mat.data %>%
  bind_cols(df_scaled_mat[marker_cols_mat]) %>%
  pivot_longer(
    cols = all_of(marker_cols_mat),
    names_to = "Marker",
    values_to = "z_score"
  )

ggplot(plot_data, aes(x = X, y = Y, color = z_score)) +
  geom_point(size = 1) +
  scale_color_gradient2(
    low = "blue",
    mid = "white",
    high = "red",
    midpoint = 0
  ) +
  facet_wrap(~ Marker) +
  xlab(paste("PC1 -", pca_var_per_mat[1], "%")) +
  ylab(paste("PC2 -", pca_var_per_mat[2], "%")) +
  theme_bw() +
  ggtitle("PCA with z-score colours for all markers")
```

<img src="index_sorting1_files/figure-commonmark/cell-59-output-1.png"
width="420" height="420" />

``` r
for (marker in marker_cols_mat) {
  pca_mat.data$z_var_mat <- df_scaled_mat[[marker]]
  p <- ggplot(data = pca_mat.data,
            aes(
              x = X,
              y = Y,
              label = Sample,
              color = z_var_mat)
          ) +
            scale_color_gradient2(
              low = "blue",
              mid = "white",
              high = "red",
              midpoint = 0,
              name = "z-score"
          ) +
            geom_point(size = 1)+
            xlab(paste("PC1 -", pca_var_per_mat[1], "%", sep = ""))+
            ylab(paste("PC2 -", pca_var_per_mat[2], "%", sep = ""))+
            theme_bw()+
            ggtitle(marker)
  print(p)
}
```

<img src="index_sorting1_files/figure-commonmark/cell-60-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-60-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-60-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-60-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-60-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-60-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-60-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-60-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-60-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-60-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-60-output-11.png"
width="420" height="420" />

``` r
pca_15.data$z_var15 <- df_scaled_15[[ marker_cols_15[8]]]

ggplot(data = pca_15.data,
        aes(
          x = X,
          y = Y,
          label = Sample,
          color = z_var15)
      ) +
        scale_color_gradient2(
          low = "blue",
          mid = "white",
          high = "red",
          midpoint = 0,
          name = "Z-score"
      ) +
        geom_point(size = 1)+
        xlab(paste("PC1 -", pca_var_per_15[1], "%", sep = ""))+
        ylab(paste("PC2 -", pca_var_per_15[2], "%", sep = ""))+
        theme_bw()+
        ggtitle("PCA graph with z-score colours")
```

<img src="index_sorting1_files/figure-commonmark/cell-61-output-1.png"
width="420" height="420" />

</details>

<details>
<summary><strong>PCA RCSM</strong></summary>

``` r
pca_rsm <- prcomp(df_scaled_rsm[marker_cols_rsm])
plot(pca_rsm$x[,1], pca_rsm$x[,2])
```

<img src="index_sorting1_files/figure-commonmark/cell-62-output-1.png"
width="420" height="420" />

``` r
pca_var_rsm <- pca_rsm$sdev^2 # how much variation in the original data each principal component accounts for
pca_var_per_rsm <- round(pca_var_rsm/sum(pca_var_rsm)*100,1)
pca_var_per_rsm
```

1.  33.9
2.  19.3
3.  13.9
4.  10.8
5.  7.8
6.  6.1
7.  4.7
8.  3.5

``` r
barplot( pca_var_per_rsm, main = "scree plot", xlab = "principal component", ylab = "percent variation")
```

<img src="index_sorting1_files/figure-commonmark/cell-64-output-1.png"
width="420" height="420" />

``` r
library(ggplot2)

pca_rsm.data <- data.frame(Sample = rownames(df_rsm),
  X = pca_rsm$x[,1],
  Y = pca_rsm$x[,2])

ggplot(data = pca_rsm.data, aes(x = X, y = Y, label = Sample))+
  geom_point(size = 1)+
  xlab(paste("PC1 -", pca_var_per_rsm[1], "%", sep = ""))+
  ylab(paste("PC2 -", pca_var_per_rsm[2], "%", sep = ""))+
  theme_bw()+
  ggtitle("PCA graph")
```

<img src="index_sorting1_files/figure-commonmark/cell-65-output-1.png"
width="420" height="420" />

``` r
loading_scores_rsm <- pca_rsm$rotation[,1]
marker_scores_rsm <- abs(loading_scores_rsm)
markers_score_ranked_rsm <- sort(marker_scores_rsm, decreasing = TRUE)
top_5_markers_rsm <- names(markers_score_ranked_rsm[1:5])

top5_loadings_rsm <- data.frame(
  Marker = top_5_markers_rsm,
  Loading = pca_rsm$rotation[top_5_markers_rsm, 1] #show the scores and sign (+/-)
)

top5_loadings_rsm
```

A data.frame: 5 × 2

| <!--/-->     | Marker \<chr\> | Loading \<dbl\> |
|--------------|----------------|-----------------|
| cKit_Median  | cKit_Median    | 0.5080123       |
| CD48_Median  | CD48_Median    | 0.3916937       |
| CD34_Median  | CD34_Median    | 0.3616295       |
| sca1_Median  | sca1_Median    | -0.3522441      |
| CD150_Median | CD150_Median   | 0.3379492       |

</details>

<details>
<summary><strong>Applying z-score colours on PCA RCSM</strong></summary>

``` r
library(dplyr)
library(tidyr)
library(ggplot2)

pca_rsm.data <- data.frame(
  Sample = rownames(df_rsm),
  X = pca_rsm$x[,1],
  Y = pca_rsm$x[,2]
)

plot_data <- pca_rsm.data %>%
  bind_cols(df_scaled_rsm[marker_cols_rsm]) %>%
  pivot_longer(
    cols = all_of(marker_cols_rsm),
    names_to = "Marker",
    values_to = "z_score"
  )

ggplot(plot_data, aes(x = X, y = Y, color = z_score)) +
  geom_point(size = 1) +
  scale_color_gradient2(
    low = "blue",
    mid = "white",
    high = "red",
    midpoint = 0
  ) +
  facet_wrap(~ Marker) +
  xlab(paste("PC1 -", pca_var_per_rsm[1], "%")) +
  ylab(paste("PC2 -", pca_var_per_rsm[2], "%")) +
  theme_bw() +
  ggtitle("PCA with z-score colours for all markers")
```


    Attaching package: ‘dplyr’


    The following objects are masked from ‘package:stats’:

        filter, lag


    The following objects are masked from ‘package:base’:

        intersect, setdiff, setequal, union

<img src="index_sorting1_files/figure-commonmark/cell-67-output-2.png"
width="420" height="420" />

``` r
for (marker in marker_cols_rsm) {
  pca_rsm.data$z_varrsm <- df_scaled_rsm[[marker]]
  p <- ggplot(data = pca_rsm.data,
            aes(
              x = X,
              y = Y,
              label = Sample,
              color = z_varrsm)
          ) +
            scale_color_gradient2(
              low = "blue",
              mid = "white",
              high = "red",
              midpoint = 0,
              name = "z-score"
          ) +
            geom_point(size = 1)+
            xlab(paste("PC1 -", pca_var_per_rsm[1], "%", sep = ""))+
            ylab(paste("PC2 -", pca_var_per_rsm[2], "%", sep = ""))+
            theme_bw()+
            ggtitle(marker)
  print(p)
}
```

<img src="index_sorting1_files/figure-commonmark/cell-68-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-68-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-68-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-68-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-68-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-68-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-68-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-68-output-8.png"
width="420" height="420" />

``` r
pca_rsm.data$z_varrsm <- df_scaled_rsm[[ marker_cols_rsm[8]]]

ggplot(data = pca_rsm.data,
        aes(
          x = X,
          y = Y,
          label = Sample,
          color = z_varrsm)
      ) +
        scale_color_gradient2(
          low = "blue",
          mid = "white",
          high = "red",
          midpoint = 0,
          name = "Z-score"
      ) +
        geom_point(size = 1)+
        xlab(paste("PC1 -", pca_var_per_rsm[1], "%", sep = ""))+
        ylab(paste("PC2 -", pca_var_per_rsm[2], "%", sep = ""))+
        theme_bw()+
        ggtitle("PCA graph with z-score colours")
```

<img src="index_sorting1_files/figure-commonmark/cell-69-output-1.png"
width="420" height="420" />

</details>

## **3D PCA**

``` r
install.packages("scatterplot3d")
library(scatterplot3d)
```

    Installing package into ‘/usr/local/lib/R/site-library’
    (as ‘lib’ is unspecified)

<details>
<summary><strong>3D PCA ERC_aim1_exp_9</strong></summary>

``` r
pca_9.data <- data.frame(
  Sample = rownames(df_9),
  PC1 = pca_9$x[,1],
  PC2 = pca_9$x[,2],
  PC3 = pca_9$x[,3]
)

pca_var_9 <- pca_9$sdev^2
pca_var_per_9 <- round(pca_var_9 / sum(pca_var_9) * 100, 1)
```

``` r
for (marker in marker_cols_9) {

  pca_9.data$z_var9 <- df_scaled_9[[marker]]


  cols <- colorRampPalette(c("blue", "white", "red"))(100)
  col_index <- as.numeric(cut(pca_9.data$z_var9, breaks = 100))

  scatterplot3d(
    x = pca_9.data$PC1,
    y = pca_9.data$PC2,
    z = pca_9.data$PC3,
    pch = 16,
    color = cols[col_index],
    xlab = paste0("PC1 - ", pca_var_per_9[1], "%"),
    ylab = paste0("PC2 - ", pca_var_per_9[2], "%"),
    zlab = paste0("PC3 - ", pca_var_per_9[3], "%"),
    main = marker
  )
}
```

<img src="index_sorting1_files/figure-commonmark/cell-72-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-72-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-72-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-72-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-72-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-72-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-72-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-72-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-72-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-72-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-72-output-11.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-72-output-12.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-72-output-13.png"
width="420" height="420" />

``` r
unique(df_9$GROUP)
```

1.  ‘NaCl_woGCSF’
2.  ‘NaCl_GCSF’
3.  ‘GCSF_GCSF’
4.  ‘GCSF_woGCSF’

``` r
pca_9.data <- data.frame(
  Sample = rownames(df_9),
  PC1 = pca_9$x[,1],
  PC2 = pca_9$x[,2],
  PC3 = pca_9$x[,3],
  Group = df_9$GROUP
)

pca_var_9 <- pca_9$sdev^2
pca_var_per_9 <- round(pca_var_9 / sum(pca_var_9) * 100, 1)


group_colors <- c(
  "NaCl_woGCSF" = "blue",
  "NaCl_GCSF" = "green",
  "GCSF_GCSF" = "red",
  "GCSF_woGCSF" = "orange"
)


scatterplot3d(
  x = pca_9.data$PC1,
  y = pca_9.data$PC2,
  z = pca_9.data$PC3,
  pch = 16,
  color = group_colors[pca_9.data$Group],
  xlab = paste0("PC1 - ", pca_var_per_9[1], "%"),
  ylab = paste0("PC2 - ", pca_var_per_9[2], "%"),
  zlab = paste0("PC3 - ", pca_var_per_9[3], "%"),
  main = "PCA 3D colored by Group"
)

legend("topright", legend = names(group_colors), col = group_colors, pch = 16)
```

<img src="index_sorting1_files/figure-commonmark/cell-74-output-1.png"
width="420" height="420" />

</details>

<details>
<summary><strong>3D PCA ERC_aim1_exp_15</strong></summary>

``` r
pca_15.data <- data.frame(
  Sample = rownames(df_15),
  PC1 = pca_15$x[,1],
  PC2 = pca_15$x[,2],
  PC3 = pca_15$x[,3]
)

pca_var_15 <- pca_15$sdev^2
pca_var_per_15 <- round(pca_var_15 / sum(pca_var_15) * 100, 1)
```

``` r
for (marker in marker_cols_15) {

  pca_15.data$z_var15 <- df_scaled_15[[marker]]


  cols <- colorRampPalette(c("blue", "white", "red"))(100)
  col_index <- as.numeric(cut(pca_15.data$z_var15, breaks = 100))

  scatterplot3d(
    x = pca_15.data$PC1,
    y = pca_15.data$PC2,
    z = pca_15.data$PC3,
    pch = 16,
    color = cols[col_index],
    xlab = paste0("PC1 - ", pca_var_per_15[1], "%"),
    ylab = paste0("PC2 - ", pca_var_per_15[2], "%"),
    zlab = paste0("PC3 - ", pca_var_per_15[3], "%"),
    main = marker
  )
}
```

<img src="index_sorting1_files/figure-commonmark/cell-76-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-76-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-76-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-76-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-76-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-76-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-76-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-76-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-76-output-9.png"
width="420" height="420" />

``` r
colnames(df_15)
```

1.  ‘mouse_id’
2.  ‘well’
3.  ‘treatment’
4.  ‘time_point’
5.  ‘number_of_cells’
6.  ‘diameter_1’
7.  ‘diameter_2’
8.  ‘diameter_3’
9.  ‘mean_diameter_mm’
10. ‘colony_shape’
11. ‘compact_11’
12. ‘dispersed’
13. ‘composition’
14. ‘notes’
15. ‘CD105_Median’
16. ‘CD150_Median’
17. ‘CD16_32_Median’
18. ‘CD34_Median’
19. ‘CD48_Median’
20. ‘cKit_Median’
21. ‘Lin_Median’
22. ‘Live_Median’
23. ‘sca1_Median’
24. ‘X’
25. ‘mouse_ID’
26. ‘well_ID’
27. ‘all_events’
28. ‘singlets_cells’
29. ‘Live_dead_Ly6C_subset’
30. ‘cKit_neg’
31. ‘low6c_mono’
32. ‘monocytes_1’
33. ‘neutrophils’
34. ‘non_mielo’
35. ‘FcR_neg’
36. ‘CD150neg_CD105pos’
37. ‘CD150pos_CD105pos’
38. ‘CD150pos_CD105neg’
39. ‘CD150neg_CD105neg’
40. ‘cKit_pos’
41. ‘GMP’
42. ‘non_GMP’
43. ‘CFU_E’
44. ‘CMP’
45. ‘preCFUE’
46. ‘preGM’
47. ‘preMegE’
48. ‘trombo’

``` r
unique(df_15$treatment)
```

1.  ‘NaCl’
2.  ‘PHZ’
3.  ‘GCSF’

``` r
pca_15.data <- data.frame(
  Sample = rownames(df_15),
  PC1 = pca_15$x[,1],
  PC2 = pca_15$x[,2],
  PC3 = pca_15$x[,3],
  Group = df_15$treatment
)

pca_var_15 <- pca_15$sdev^2
pca_var_per_15 <- round(pca_var_15 / sum(pca_var_15) * 100, 1)


group_colors <- c(
  "NaCl" = "blue",
  "PHZ" = "green",
  "GCSF" = "red"
)


scatterplot3d(
  x = pca_15.data$PC1,
  y = pca_15.data$PC2,
  z = pca_15.data$PC3,
  pch = 16,
  color = group_colors[pca_15.data$Group],
  xlab = paste0("PC1 - ", pca_var_per_15[1], "%"),
  ylab = paste0("PC2 - ", pca_var_per_15[2], "%"),
  zlab = paste0("PC3 - ", pca_var_per_15[3], "%"),
  main = "PCA 3D colored by Group"
)

legend("topright", legend = names(group_colors), col = group_colors, pch = 16)
```

<img src="index_sorting1_files/figure-commonmark/cell-79-output-1.png"
width="420" height="420" />

</details>

<details>
<summary><strong>3D PCA ERC_aim1_exp_13</strong></summary>

``` r
pca_13.data <- data.frame(
  Sample = rownames(df_13),
  PC1 = pca_13$x[,1],
  PC2 = pca_13$x[,2],
  PC3 = pca_13$x[,3]
)

pca_var_13 <- pca_13$sdev^2
pca_var_per_13 <- round(pca_var_13 / sum(pca_var_13) * 100, 1)
```

``` r
for (marker in marker_cols_13) {

  pca_13.data$z_var13 <- df_scaled_13[[marker]]


  cols <- colorRampPalette(c("blue", "white", "red"))(100)
  col_index <- as.numeric(cut(pca_13.data$z_var13, breaks = 100))

  scatterplot3d(
    x = pca_13.data$PC1,
    y = pca_13.data$PC2,
    z = pca_13.data$PC3,
    pch = 16,
    color = cols[col_index],
    xlab = paste0("PC1 - ", pca_var_per_13[1], "%"),
    ylab = paste0("PC2 - ", pca_var_per_13[2], "%"),
    zlab = paste0("PC3 - ", pca_var_per_13[3], "%"),
    main = marker
  )
}
```

<img src="index_sorting1_files/figure-commonmark/cell-81-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-81-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-81-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-81-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-81-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-81-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-81-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-81-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-81-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-81-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-81-output-11.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-81-output-12.png"
width="420" height="420" />

``` r
colnames(df_13)
```

1.  ‘…1’
2.  ‘Row.names’
3.  ‘mouse.ID’
4.  ‘well.ID’
5.  ‘first_treatment.x’
6.  ‘second_treatment.x’
7.  ‘medium’
8.  ‘time.point’
9.  ‘number.of.cells’
10. ‘diameter.1’
11. ‘diameter.2’
12. ‘diameter.3’
13. ‘mean.diameter..mm.’
14. ‘colony.shape’
15. ‘compact’
16. ‘dispersed’
17. ‘composition’
18. ‘comments’
19. ‘first_treatment.y’
20. ‘second_treatment.y’
21. ‘invitro_treatment’
22. ‘GROUP’
23. ‘CHIMERISM’
24. ‘all_events’
25. ‘singlets_cells’
26. ‘Live_dead_Ly6C_subset’
27. ‘FSC_A_medium_SSC_A_high’
28. ‘FSC_low.SSC_low’
29. ‘FSChigh_SSChigh’
30. ‘FSClow_SSC_high’
31. ‘SSC_low_FSC_high’
32. ‘cKit_neg’
33. ‘low6C_mono’
34. ‘CD16_32neg_CD71hi’
35. ‘Ter119neg_CD105pos’
36. ‘Ter119pos_CD105pos’
37. ‘Ter119pos_CD105neg’
38. ‘Ter119neg_CD105neg’
39. ‘CD16_32pos_CD71hi’
40. ‘CD16_32neg_CD71pos’
41. ‘CD16_32low_CD71low’
42. ‘CD16_32neg_CD71neg’
43. ‘monocytes_1’
44. ‘FcR_hi’
45. ‘FcR_low’
46. ‘FcR_neg’
47. ‘neutrophils’
48. ‘non_mielo_wide’
49. ‘Ter119_pos_CD16_32neg’
50. ‘CD71high_Ter119neg’
51. ‘CD71pos_Ter119low’
52. ‘CD71pos_Ter119neg’
53. ‘non_mielo’
54. ‘early_baso’
55. ‘late_baso’
56. ‘polychrom’
57. ‘proerythro’
58. ‘Q1_CD150neg_CD105pos’
59. ‘Q2_CD150pos_CD105pos’
60. ‘Q3_CD150pos_CD105neg’
61. ‘Q4_CD150neg_CD105neg’
62. ‘cKit_pos’
63. ‘CD150pos_CD16_32neg’
64. ‘GMP_1’
65. ‘GMP_2’
66. ‘non_GMP’
67. ‘CMP_1’
68. ‘CFUE’
69. ‘preCFUE’
70. ‘preGM’
71. ‘preMegE’
72. ‘CD71pos_CD34neg’
73. ‘CMP_1_CD71pos_CD105neg’
74. ‘CMP_1_CD71pos_CD105pos’
75. ‘CMP_2’
76. ‘trombo’
77. ‘NOTES’
78. ‘Events’
79. ‘Spectral.Alexa.700_Geo.Mean’
80. ‘Lin_Median’
81. ‘Spectral.APC_Geo.Mean’
82. ‘CD150_Median’
83. ‘Spectral.BB.700_Geo.Mean’
84. ‘CD48_Median’
85. ‘Spectral.BUV.395_Geo.Mean’
86. ‘CD16_32_Median’
87. ‘Spectral.BUV.615_Geo.Mean’
88. ‘CD105_Median’
89. ‘Spectral.BUV.737_Geo.Mean’
90. ‘CD71_Median’
91. ‘Spectral.BV.421_Geo.Mean’
92. ‘cKit_Median’
93. ‘Spectral.GFP_Geo.Mean’
94. ‘GFP_Median’
95. ‘Spectral.LIVE.DEAD.Fixable.Near.IR.Dead.Cell.Stain_Geo.Mean’
96. ‘Live_Median’
97. ‘Spectral.PE.CF594_Geo.Mean’
98. ‘CD135_Median’
99. ‘Spectral.PE.Cy7_Geo.Mean’
100. ‘sca1_Median’
101. ‘Spectral.PE_Geo.Mean’
102. ‘CD34_Median’
103. ‘…103’
104. ‘…104’

``` r
unique(df_13$GROUP)
```

1.  ‘N_N_woGCSF’
2.  ‘N_N_GCSF’
3.  ‘G_N_woGCSF’
4.  ‘G_N_GCSF’
5.  ‘G_G_GCSF’
6.  ‘G_G_woGCSF’
7.  NA
8.  ‘N_G_woGCSF’
9.  ‘N_G_GCSF’

``` r
pca_13.data <- data.frame(
  Sample = rownames(df_13),
  PC1 = pca_13$x[,1],
  PC2 = pca_13$x[,2],
  PC3 = pca_13$x[,3],
  Group = df_13$GROUP
)

pca_var_13 <- pca_13$sdev^2
pca_var_per_13 <- round(pca_var_13 / sum(pca_var_13) * 100, 1)


group_colors <- c(
  "N_N_woGCSF" = "blue",
  "N_N_GCSF" = "green",
  "G_N_woGCSF" = "red",
  "G_N_GCSF" = "orange",
  "G_G_GCSF" = "purple",
  "G_G_woGCSF" = "yellow",
  "N_G_woGCSF" = "black",
  "N_G_GCSF" = "brown",
  "NA" = "pink"
)


scatterplot3d(
  x = pca_13.data$PC1,
  y = pca_13.data$PC2,
  z = pca_13.data$PC3,
  pch = 16,
  color = group_colors[pca_13.data$Group],
  xlab = paste0("PC1 - ", pca_var_per_13[1], "%"),
  ylab = paste0("PC2 - ", pca_var_per_13[2], "%"),
  zlab = paste0("PC3 - ", pca_var_per_13[3], "%"),
  main = "PCA 3D colored by Group"
)

legend("topright", legend = names(group_colors), col = group_colors, pch = 16)
```

<img src="index_sorting1_files/figure-commonmark/cell-84-output-1.png"
width="420" height="420" />

</details>

<details>
<summary><strong>3D PCA Mateusz</strong></summary>

``` r
pca_mat.data <- data.frame(
  Sample = rownames(df_mat),
  PC1 = pca_mat$x[,1],
  PC2 = pca_mat$x[,2],
  PC3 = pca_mat$x[,3]
)

pca_var_mat <- pca_mat$sdev^2
pca_var_per_mat <- round(pca_var_mat / sum(pca_var_mat) * 100, 1)
```

``` r
for (marker in marker_cols_mat) {

  pca_mat.data$z_var_mat<- df_scaled_mat[[marker]]


  cols <- colorRampPalette(c("blue", "white", "red"))(100)
  col_index <- as.numeric(cut(pca_mat.data$z_var_mat, breaks = 100))

  scatterplot3d(
    x = pca_mat.data$PC1,
    y = pca_mat.data$PC2,
    z = pca_mat.data$PC3,
    pch = 16,
    color = cols[col_index],
    xlab = paste0("PC1 - ", pca_var_per_mat[1], "%"),
    ylab = paste0("PC2 - ", pca_var_per_mat[2], "%"),
    zlab = paste0("PC3 - ", pca_var_per_mat[3], "%"),
    main = marker
  )
}
```

<img src="index_sorting1_files/figure-commonmark/cell-86-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-86-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-86-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-86-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-86-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-86-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-86-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-86-output-8.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-86-output-9.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-86-output-10.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-86-output-11.png"
width="420" height="420" />

``` r
colnames(df_mat)
```

1.  ‘Plate.x’
2.  ‘Group.x’
3.  ‘Treatment.x’
4.  ‘Well.x’
5.  ‘ID.x’
6.  ‘ID_shortcut.x’
7.  ‘Events’
8.  ‘Median’
9.  ‘Median.1’
10. ‘Median.2’
11. ‘Median.3’
12. ‘Median.4’
13. ‘Median.5’
14. ‘Median.6’
15. ‘Median.7’
16. ‘Median.8’
17. ‘Median.9’
18. ‘Median.10’
19. ‘Median.11’
20. ‘Median.12’
21. ‘Median.13’
22. ‘Diameter_1’
23. ‘Diameter_2’
24. ‘Diameter_3’
25. ‘mean.diameter.mm’
26. ‘Colony_shape’
27. ‘Shape_composition’
28. ‘Composition’
29. ‘Live_dead_Ly6C_subset’
30. ‘cKit_neg’
31. ‘granulocytes_1’
32. ‘low6c_mono’
33. ‘monocytes_1’
34. ‘FcR_hi’
35. ‘FcR_low’
36. ‘FcR_neg’
37. ‘neutrophils’
38. ‘non_myelo’
39. ‘CD16_32hi_CD71low’
40. ‘CD16_32hi_CD71neg’
41. ‘CD16_32low_CD71low’
42. ‘CD16_32low_CD71neg’
43. ‘CD16_32neg_CD71hi’
44. ‘CD16_32neg_CD71low’
45. ‘CD16_32neg_CD71neg’
46. ‘CD16_32pos_CD71hi’
47. ‘non_myelo_wide’
48. ‘Q1..CD150….CD105.’
49. ‘CD71hi_Ter119neg’
50. ‘CD71pos_Ter119low’
51. ‘CD71pos_Ter119neg’
52. ‘Q2..CD150….CD105.’
53. ‘Q3..CD150….CD105.’
54. ‘Q4..CD150….CD105.’
55. ‘cKit_pos’
56. ‘Ter119_pos_CD16_32neg’
57. ‘GMP_1’
58. ‘GMP_2’
59. ‘GMP_combined’
60. ‘non_GMP’
61. ‘CMP_1’
62. ‘trombo’
63. ‘FSC.A_medium_SSC.A_high’
64. ‘FSC_low_SSC_low’
65. ‘FSChigh_SSChigh’
66. ‘FSClow_SSC_high’
67. ‘SSC_low_FSC_high’

``` r
unique(df_mat$Group.x)
```

1.  ‘Y_Neo_neg’
2.  ‘Y_Neo_pos’
3.  ‘O_Neo_neg’
4.  ‘O_Neo_pos’

``` r
pca_mat.data <- data.frame(
  Sample = rownames(df_mat),
  PC1 = pca_mat$x[,1],
  PC2 = pca_mat$x[,2],
  PC3 = pca_mat$x[,3],
  Group = df_mat$Group.x
)

pca_var_mat <- pca_mat$sdev^2
pca_var_per_mat <- round(pca_var_mat / sum(pca_var_mat) * 100, 1)


group_colors <- c(
  "Y_Neo_neg" = "blue",
  "Y_Neo_pos" = "green",
  "O_Neo_neg" = "red",
  "O_Neo_pos" = "orange"
)


scatterplot3d(
  x = pca_mat.data$PC1,
  y = pca_mat.data$PC2,
  z = pca_mat.data$PC3,
  pch = 16,
  color = group_colors[pca_mat.data$Group],
  xlab = paste0("PC1 - ", pca_var_per_mat[1], "%"),
  ylab = paste0("PC2 - ", pca_var_per_mat[2], "%"),
  zlab = paste0("PC3 - ", pca_var_per_mat[3], "%"),
  main = "PCA 3D colored by Group"
)

legend("topright", legend = names(group_colors), col = group_colors, pch = 16)
```

<img src="index_sorting1_files/figure-commonmark/cell-89-output-1.png"
width="420" height="420" />

</details>

<details>
<summary><strong>3D PCA RCSM</strong></summary>

``` r
pca_rsm.data <- data.frame(
  Sample = rownames(df_rsm),
  PC1 = pca_rsm$x[,1],
  PC2 = pca_rsm$x[,2],
  PC3 = pca_rsm$x[,3]
)

pca_var_rsm <- pca_rsm$sdev^2
pca_var_per_rsm <- round(pca_var_rsm / sum(pca_var_rsm) * 100, 1)
```

``` r
for (marker in marker_cols_rsm) {

  pca_rsm.data$z_varrsm <- df_scaled_rsm[[marker]]


  cols <- colorRampPalette(c("blue", "white", "red"))(100)
  col_index <- as.numeric(cut(pca_rsm.data$z_varrsm, breaks = 100))

  scatterplot3d(
    x = pca_rsm.data$PC1,
    y = pca_rsm.data$PC2,
    z = pca_rsm.data$PC3,
    pch = 16,
    color = cols[col_index],
    xlab = paste0("PC1 - ", pca_var_per_rsm[1], "%"),
    ylab = paste0("PC2 - ", pca_var_per_rsm[2], "%"),
    zlab = paste0("PC3 - ", pca_var_per_rsm[3], "%"),
    main = marker
  )
}
```

<img src="index_sorting1_files/figure-commonmark/cell-91-output-1.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-91-output-2.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-91-output-3.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-91-output-4.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-91-output-5.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-91-output-6.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-91-output-7.png"
width="420" height="420" />

<img src="index_sorting1_files/figure-commonmark/cell-91-output-8.png"
width="420" height="420" />

``` r
colnames(df_rsm)
```

1.  ‘…1’
2.  ‘timepoint.x’
3.  ‘treatment.x’
4.  ‘mice_ID.x’
5.  ‘well.x’
6.  ‘diameter_1’
7.  ‘diameter_2’
8.  ‘diameter_3’
9.  ‘mean_diameter_mm’
10. ‘colony_shape’
11. ‘shape_subtype’
12. ‘composition.x’
13. ‘X’
14. ‘timepoint.y’
15. ‘treatment.y’
16. ‘mice.ID’
17. ‘well.y’
18. ‘weeks.of.growing’
19. ‘FlowJo.ID’
20. ‘Count’
21. ‘QC_FSC_H’
22. ‘Cells’
23. ‘Single_Cells’
24. ‘Single_Cells_2’
25. ‘Live_dead_Ly6C_subset’
26. ‘cKit_neg’
27. ‘eosinofils’
28. ‘low6c_mono’
29. ‘monocytes_1’
30. ‘FcR_hi’
31. ‘FcR_low’
32. ‘FcR_neg’
33. ‘neutrophils’
34. ‘non_mielo’
35. ‘CD16_32hi_CD71low’
36. ‘CD16_32hi_CD71neg’
37. ‘CD16_32low_CD71low’
38. ‘CD16_32low_CD71neg’
39. ‘CD16_32neg_CD71hi’
40. ‘CD16_32neg_CD71neg’
41. ‘CD16_32neg_CD71pos’
42. ‘CD16_32pos_CD71hi’
43. ‘non_mielo_wide’
44. ‘Q1..CD150….CD105.’
45. ‘CD71high_Ter119neg’
46. ‘CD71pos_Ter119low’
47. ‘CD71pos_Ter119neg’
48. ‘Q2..CD150….CD105.’
49. ‘Q3..CD150….CD105.’
50. ‘Q4..CD150….CD105.’
51. ‘Ter119pos_CD16_32neg’
52. ‘cKit_pos’
53. ‘CD150pos_CD16_32neg’
54. ‘GMP_1’
55. ‘GMP_2’
56. ‘non_GMP’
57. ‘CMP_1’
58. ‘trombo’
59. ‘FSC.A_medium_SSC.A_high’
60. ‘FSC_low.SSC_low’
61. ‘FSChigh_SSChigh’
62. ‘FSClow_SSC_high’
63. ‘SSC_low_FSC_high’
64. ‘timepoint’
65. ‘treatment’
66. ‘mice_ID.y’
67. ‘well’
68. ‘shape’
69. ‘subtype’
70. ‘composition.y’
71. ‘Neo1_Median’
72. ‘CD150_Median’
73. ‘Lin_Median’
74. ‘cKit_Median’
75. ‘CD48_Median’
76. ‘Live_Median’
77. ‘CD34_Median’
78. ‘sca1_Median’
