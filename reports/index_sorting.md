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

<img src="index_sorting_files/figure-commonmark/cell-2-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-2-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-2-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-2-output-4.png"
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

<img src="index_sorting_files/figure-commonmark/cell-3-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-3-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-3-output-3.png"
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

<img src="index_sorting_files/figure-commonmark/cell-4-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-4-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-4-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-4-output-4.png"
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

<img src="index_sorting_files/figure-commonmark/cell-5-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-5-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-5-output-3.png"
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

<img src="index_sorting_files/figure-commonmark/cell-7-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-7-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-7-output-5.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-7-output-6.png"
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

<img src="index_sorting_files/figure-commonmark/cell-8-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-8-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-8-output-3.png"
width="420" height="420" />

###As we can see after logarithm transformation the distirbution is way
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

<img src="index_sorting_files/figure-commonmark/cell-9-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-9-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-9-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-9-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-9-output-5.png"
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

<img src="index_sorting_files/figure-commonmark/cell-10-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-10-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-10-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-10-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-10-output-5.png"
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

<img src="index_sorting_files/figure-commonmark/cell-11-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-11-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-11-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-11-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-11-output-5.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-11-output-6.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-11-output-7.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-11-output-8.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-11-output-9.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-11-output-10.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-11-output-11.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-11-output-12.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-11-output-13.png"
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

<img src="index_sorting_files/figure-commonmark/cell-12-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-12-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-12-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-12-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-12-output-5.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-12-output-6.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-12-output-7.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-12-output-8.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-12-output-9.png"
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

<img src="index_sorting_files/figure-commonmark/cell-13-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-13-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-13-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-13-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-13-output-5.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-13-output-6.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-13-output-7.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-13-output-8.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-13-output-9.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-13-output-10.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-13-output-11.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-13-output-12.png"
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

<img src="index_sorting_files/figure-commonmark/cell-14-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-14-output-2.png"
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

<img src="index_sorting_files/figure-commonmark/cell-15-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-5.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-6.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-7.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-8.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-9.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-10.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-11.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-12.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-13.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-14.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-15.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-16.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-17.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-18.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-19.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-20.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-21.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-22.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-23.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-24.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-25.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-15-output-26.png"
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

<img src="index_sorting_files/figure-commonmark/cell-16-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-16-output-2.png"
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

<img src="index_sorting_files/figure-commonmark/cell-17-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-5.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-6.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-7.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-8.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-9.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-10.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-11.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-12.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-13.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-14.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-15.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-16.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-17.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-17-output-18.png"
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

<img src="index_sorting_files/figure-commonmark/cell-18-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-18-output-2.png"
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

<img src="index_sorting_files/figure-commonmark/cell-19-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-5.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-6.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-7.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-8.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-9.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-10.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-11.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-12.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-13.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-14.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-15.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-16.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-17.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-18.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-19.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-20.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-21.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-22.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-23.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-19-output-24.png"
width="420" height="420" />

</details>

## **PCA**

<details>
<summary><strong>PCA ERC_aim1_exp_9</strong></summary>

``` r
pca_9 <- prcomp(df_scaled_9[marker_cols_9])
plot(pca_9$x[,1], pca_9$x[,2])
```

<img src="index_sorting_files/figure-commonmark/cell-20-output-1.png"
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

<img src="index_sorting_files/figure-commonmark/cell-22-output-1.png"
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

<img src="index_sorting_files/figure-commonmark/cell-23-output-1.png"
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


    Dołączanie pakietu: ‘dplyr’


    Następujące obiekty zostały zakryte z ‘package:stats’:

        filter, lag


    Następujące obiekty zostały zakryte z ‘package:base’:

        intersect, setdiff, setequal, union

<img src="index_sorting_files/figure-commonmark/cell-25-output-2.png"
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

<img src="index_sorting_files/figure-commonmark/cell-26-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-26-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-26-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-26-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-26-output-5.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-26-output-6.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-26-output-7.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-26-output-8.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-26-output-9.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-26-output-10.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-26-output-11.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-26-output-12.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-26-output-13.png"
width="420" height="420" />

</details>

<details>
<summary><strong>PCA ERC_aim1_exp_15</strong></summary>

``` r
pca_15 <- prcomp(df_scaled_15[marker_cols_15])
plot(pca_15$x[,1], pca_15$x[,2])
```

<img src="index_sorting_files/figure-commonmark/cell-27-output-1.png"
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

<img src="index_sorting_files/figure-commonmark/cell-29-output-1.png"
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

<img src="index_sorting_files/figure-commonmark/cell-30-output-1.png"
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

<img src="index_sorting_files/figure-commonmark/cell-32-output-1.png"
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

<img src="index_sorting_files/figure-commonmark/cell-33-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-33-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-33-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-33-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-33-output-5.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-33-output-6.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-33-output-7.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-33-output-8.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-33-output-9.png"
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

<img src="index_sorting_files/figure-commonmark/cell-34-output-1.png"
width="420" height="420" />

</details>

<details>
<summary><strong>PCA ERC_aim1_exp_13</strong></summary>

``` r
pca_13 <- prcomp(df_scaled_13[marker_cols_13])
plot(pca_13$x[,1], pca_13$x[,2])
```

<img src="index_sorting_files/figure-commonmark/cell-35-output-1.png"
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

<img src="index_sorting_files/figure-commonmark/cell-37-output-1.png"
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

<img src="index_sorting_files/figure-commonmark/cell-38-output-1.png"
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

<img src="index_sorting_files/figure-commonmark/cell-40-output-1.png"
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

<img src="index_sorting_files/figure-commonmark/cell-41-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-41-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-41-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-41-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-41-output-5.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-41-output-6.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-41-output-7.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-41-output-8.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-41-output-9.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-41-output-10.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-41-output-11.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-41-output-12.png"
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

<img src="index_sorting_files/figure-commonmark/cell-42-output-1.png"
width="420" height="420" />

</details>

## **3D PCA**

``` r
install.packages("scatterplot3d")
library(scatterplot3d)
```

    Instalowanie pakietu w ‘/opt/homebrew/lib/R/4.4/site-library’
    (ponieważ ‘lib’ nie jest określony)

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

<img src="index_sorting_files/figure-commonmark/cell-45-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-45-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-45-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-45-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-45-output-5.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-45-output-6.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-45-output-7.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-45-output-8.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-45-output-9.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-45-output-10.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-45-output-11.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-45-output-12.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-45-output-13.png"
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

<img src="index_sorting_files/figure-commonmark/cell-47-output-1.png"
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

<img src="index_sorting_files/figure-commonmark/cell-49-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-49-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-49-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-49-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-49-output-5.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-49-output-6.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-49-output-7.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-49-output-8.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-49-output-9.png"
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

<img src="index_sorting_files/figure-commonmark/cell-52-output-1.png"
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

<img src="index_sorting_files/figure-commonmark/cell-54-output-1.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-54-output-2.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-54-output-3.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-54-output-4.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-54-output-5.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-54-output-6.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-54-output-7.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-54-output-8.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-54-output-9.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-54-output-10.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-54-output-11.png"
width="420" height="420" />

<img src="index_sorting_files/figure-commonmark/cell-54-output-12.png"
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

<img src="index_sorting_files/figure-commonmark/cell-57-output-1.png"
width="420" height="420" />

</details>
