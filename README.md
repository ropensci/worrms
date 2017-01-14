worrms
======



<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Build Status](https://travis-ci.org/ropensci/worrms.svg?branch=master)](https://travis-ci.org/ropensci/worrms)
[![codecov](https://codecov.io/gh/ropensci/worrms/branch/master/graph/badge.svg)](https://codecov.io/gh/ropensci/worrms)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/worrms)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/worrms)](https://cran.r-project.org/package=worrms)

`worrms` is a R client for the World Register of Marine Species

* [World Register of Marine Species (WoRMS)](http://www.marinespecies.org/)
* [WoRMS REST API docs](http://www.marinespecies.org/rest/)

## Installation

More stable CRAN version


```r
install.packages("worrms")
```

Development version


```r
devtools::install_github("ropensci/worrms")
```


```r
library("worrms")
```

## get records

by date


```r
wm_records_date('2016-12-23T05:59:45+00:00')
#> # A tibble: 50 × 25
#>    AphiaID                                                           url
#> *    <int>                                                         <chr>
#> 1   894298 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894298
#> 2   894301 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894301
#> 3   894297 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894297
#> 4   894302 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894302
#> 5   894296 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894296
#> 6   894299 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894299
#> 7   894303 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894303
#> 8   906769 http://www.marinespecies.org/aphia.php?p=taxdetails&id=906769
#> 9   909454 http://www.marinespecies.org/aphia.php?p=taxdetails&id=909454
#> 10  915236 http://www.marinespecies.org/aphia.php?p=taxdetails&id=915236
#> # ... with 40 more rows, and 23 more variables: scientificname <chr>,
#> #   authority <chr>, status <chr>, unacceptreason <lgl>, rank <chr>,
#> #   valid_AphiaID <int>, valid_name <chr>, valid_authority <chr>,
#> #   kingdom <chr>, phylum <chr>, class <chr>, order <chr>, family <chr>,
#> #   genus <chr>, citation <chr>, lsid <chr>, isMarine <int>,
#> #   isBrackish <lgl>, isFreshwater <lgl>, isTerrestrial <lgl>,
#> #   isExtinct <int>, match_type <chr>, modified <chr>
```

by a taxonomic name


```r
wm_records_name(name = 'Platanista gangetica')
#> # A tibble: 3 × 25
#>   AphiaID                                                           url
#> *   <int>                                                         <chr>
#> 1  254967 http://www.marinespecies.org/aphia.php?p=taxdetails&id=254967
#> 2  383571 http://www.marinespecies.org/aphia.php?p=taxdetails&id=383571
#> 3  254969 http://www.marinespecies.org/aphia.php?p=taxdetails&id=254969
#> # ... with 23 more variables: scientificname <chr>, authority <chr>,
#> #   status <chr>, unacceptreason <lgl>, rank <chr>, valid_AphiaID <int>,
#> #   valid_name <chr>, valid_authority <chr>, kingdom <chr>, phylum <chr>,
#> #   class <chr>, order <chr>, family <chr>, genus <chr>, citation <chr>,
#> #   lsid <chr>, isMarine <int>, isBrackish <lgl>, isFreshwater <int>,
#> #   isTerrestrial <int>, isExtinct <lgl>, match_type <chr>, modified <chr>
```

by many names


```r
wm_records_names(name = c('Platanista gangetica', 'Coryphaena'))
#> [[1]]
#> # A tibble: 1 × 25
#>   AphiaID                                                           url
#> *   <int>                                                         <chr>
#> 1  254967 http://www.marinespecies.org/aphia.php?p=taxdetails&id=254967
#> # ... with 23 more variables: scientificname <chr>, authority <chr>,
#> #   status <chr>, unacceptreason <lgl>, rank <chr>, valid_AphiaID <int>,
#> #   valid_name <chr>, valid_authority <chr>, kingdom <chr>, phylum <chr>,
#> #   class <chr>, order <chr>, family <chr>, genus <chr>, citation <chr>,
#> #   lsid <chr>, isMarine <lgl>, isBrackish <lgl>, isFreshwater <int>,
#> #   isTerrestrial <lgl>, isExtinct <lgl>, match_type <chr>, modified <chr>
#>
#> [[2]]
#> # A tibble: 2 × 25
#>   AphiaID                                                           url
#> *   <int>                                                         <chr>
#> 1  125960 http://www.marinespecies.org/aphia.php?p=taxdetails&id=125960
#> 2  843430                                                          <NA>
#> # ... with 23 more variables: scientificname <chr>, authority <chr>,
#> #   status <chr>, unacceptreason <chr>, rank <chr>, valid_AphiaID <int>,
#> #   valid_name <chr>, valid_authority <chr>, kingdom <chr>, phylum <chr>,
#> #   class <chr>, order <chr>, family <chr>, genus <chr>, citation <chr>,
#> #   lsid <chr>, isMarine <int>, isBrackish <int>, isFreshwater <int>,
#> #   isTerrestrial <lgl>, isExtinct <lgl>, match_type <chr>, modified <chr>
```

by common name


```r
wm_records_common(name = 'clam')
#> # A tibble: 2 × 25
#>   AphiaID                                                           url
#> *   <int>                                                         <chr>
#> 1  141919 http://www.marinespecies.org/aphia.php?p=taxdetails&id=141919
#> 2  141936 http://www.marinespecies.org/aphia.php?p=taxdetails&id=141936
#> # ... with 23 more variables: scientificname <chr>, authority <chr>,
#> #   status <chr>, unacceptreason <lgl>, rank <chr>, valid_AphiaID <int>,
#> #   valid_name <chr>, valid_authority <chr>, kingdom <chr>, phylum <chr>,
#> #   class <chr>, order <chr>, family <chr>, genus <chr>, citation <chr>,
#> #   lsid <chr>, isMarine <int>, isBrackish <lgl>, isFreshwater <lgl>,
#> #   isTerrestrial <lgl>, isExtinct <lgl>, match_type <chr>, modified <chr>
```

using the TAXMATCH algorithm


```r
wm_records_taxamatch(name = 'Platanista gangetica')
#> [[1]]
#> # A tibble: 1 × 25
#>   AphiaID                                                           url
#> *   <int>                                                         <chr>
#> 1  254967 http://www.marinespecies.org/aphia.php?p=taxdetails&id=254967
#> # ... with 23 more variables: scientificname <chr>, authority <chr>,
#> #   status <chr>, unacceptreason <lgl>, rank <chr>, valid_AphiaID <int>,
#> #   valid_name <chr>, valid_authority <chr>, kingdom <chr>, phylum <chr>,
#> #   class <chr>, order <chr>, family <chr>, genus <chr>, citation <chr>,
#> #   lsid <chr>, isMarine <lgl>, isBrackish <lgl>, isFreshwater <int>,
#> #   isTerrestrial <lgl>, isExtinct <lgl>, match_type <chr>, modified <chr>
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/worrms/issues).
* License: MIT
* Get citation information for `worrms` in R doing `citation(package = 'worrms')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md).
By participating in this project you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
