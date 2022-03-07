# BurkittLymphomaR

The `BurkittLymphomaR` R package accompanies the analysis carried out in the [burkitt_lymphoma](https://github.com/kane9530/burkitt_lymphoma) github repository. 

## Installation

You can install the development version of `BurkittLymphomaR` like so:

``` r
devtools::install_github("kane9530/BurkittLymphomaR")
```

## Loading datasets
For function documentation, run `?my_function`

``` r
library(BurkittLymphomaR)

print(dplyr::glimpse(BLGSP_DGEList))
print(dplyr::glimpse(BLGSP_metadata))
print(dplyr::glimpse(ebv_genes))
print(broadSet.C2.ALL)

```
