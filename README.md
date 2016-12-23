worrms
======



[![Build Status](https://travis-ci.org/ropensci/worrms.svg?branch=master)](https://travis-ci.org/ropensci/worrms)
[![codecov](https://codecov.io/gh/ropensci/worrms/branch/master/graph/badge.svg)](https://codecov.io/gh/ropensci/worrms)

`worrms` is a R client for the World Register of Marine Species

* [World Register of Marine Species (WoRMS)](http://www.marinespecies.org/)
* [WoRMS REST API docs](http://www.marinespecies.org/rest/)

## Installation


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
#> 1   894300 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894300
#> 2   894298 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894298
#> 3   894301 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894301
#> 4   894297 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894297
#> 5   894302 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894302
#> 6   894296 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894296
#> 7   894299 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894299
#> 8   894303 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894303
#> 9   900689 http://www.marinespecies.org/aphia.php?p=taxdetails&id=900689
#> 10  897486 http://www.marinespecies.org/aphia.php?p=taxdetails&id=897486
#> # ... with 40 more rows, and 23 more variables: scientificname <chr>,
#> #   authority <chr>, status <chr>, unacceptreason <lgl>, rank <lgl>,
#> #   valid_AphiaID <int>, valid_name <chr>, valid_authority <chr>,
#> #   kingdom <lgl>, phylum <lgl>, class <lgl>, order <lgl>, family <lgl>,
#> #   genus <lgl>, citation <chr>, lsid <chr>, isMarine <int>,
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
wm_records_taxmatch(name = 'Platanista gangetica')
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
