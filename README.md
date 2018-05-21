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

## records

by date


```r
wm_records_date('2016-12-23T05:59:45+00:00')
#> # A tibble: 50 x 25
#>    AphiaID                                                           url
#>  *   <int>                                                         <chr>
#>  1  894298 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894298
#>  2  894301 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894301
#>  3  894297 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894297
#>  4  894302 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894302
#>  5  894296 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894296
#>  6  894299 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894299
#>  7  894303 http://www.marinespecies.org/aphia.php?p=taxdetails&id=894303
#>  8  915236 http://www.marinespecies.org/aphia.php?p=taxdetails&id=915236
#>  9  906769 http://www.marinespecies.org/aphia.php?p=taxdetails&id=906769
#> 10  909454 http://www.marinespecies.org/aphia.php?p=taxdetails&id=909454
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
#> # A tibble: 3 x 25
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
#> # A tibble: 1 x 25
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
#> # A tibble: 2 x 25
#>   AphiaID                                                           url
#> *   <int>                                                         <chr>
#> 1  125960 http://www.marinespecies.org/aphia.php?p=taxdetails&id=125960
#> 2  843430                                                          <NA>
#> # ... with 23 more variables: scientificname <chr>, authority <chr>,
#> #   status <chr>, unacceptreason <chr>, rank <chr>, valid_AphiaID <int>,
#> #   valid_name <chr>, valid_authority <chr>, kingdom <chr>, phylum <chr>,
#> #   class <chr>, order <chr>, family <chr>, genus <chr>, citation <chr>,
#> #   lsid <chr>, isMarine <int>, isBrackish <int>, isFreshwater <int>,
#> #   isTerrestrial <int>, isExtinct <lgl>, match_type <chr>, modified <chr>
```

by common name


```r
wm_records_common(name = 'clam')
#> # A tibble: 2 x 25
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
#> # A tibble: 1 x 25
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

## attributes (i.e., traits)

attribute definition by ID


```r
wm_attr_def(id = 1)
#> # A tibble: 1 x 4
#>   measurementTypeID        measurementType CategoryID             children
#> *             <int>                  <chr>      <int>               <list>
#> 1                 1 IUCN Red List Category          1 <data.frame [2 x 4]>
```

attribute data by AphiaID


```r
wm_attr_data(id = 127160)
#> # A tibble: 24 x 10
#>    AphiaID measurementTypeID               measurementType
#>  *   <chr>             <int>                         <chr>
#>  1  127160                23 Species importance to society
#>  2  127160                23 Species importance to society
#>  3  127160                23 Species importance to society
#>  4  127160                23 Species importance to society
#>  5  127160                23 Species importance to society
#>  6  127160                23 Species importance to society
#>  7  127160                23 Species importance to society
#>  8  127160                23 Species importance to society
#>  9  127160                23 Species importance to society
#> 10  127160                23 Species importance to society
#> # ... with 14 more rows, and 7 more variables: measurementValue <chr>,
#> #   source_id <int>, reference <chr>, qualitystatus <chr>,
#> #   AphiaID_Inherited <int>, CategoryID <int>, children <list>
```

attributes grouped by a CategoryID


```r
wm_attr_category(id = 7)
#> # A tibble: 5 x 4
#>   measurementValueID   measurementValue measurementValueCode
#> *              <int>              <chr>                <lgl>
#> 1                183            benthos                   NA
#> 2                184           plankton                   NA
#> 3                194             nekton                   NA
#> 4                323            neuston                   NA
#> 5                331 land (terrestrial)                   NA
#> # ... with 1 more variables: children <list>
```

AphiaIDs by attribute definition ID


```r
wm_attr_aphia(id = 4)
#> # A tibble: 50 x 2
#>    AphiaID            Attributes
#>  *   <int>                <list>
#>  1      11 <data.frame [1 x 10]>
#>  2      55 <data.frame [2 x 10]>
#>  3      57 <data.frame [2 x 10]>
#>  4      58 <data.frame [2 x 10]>
#>  5      59 <data.frame [2 x 10]>
#>  6      63 <data.frame [2 x 10]>
#>  7      64 <data.frame [2 x 10]>
#>  8      69 <data.frame [2 x 10]>
#>  9      90 <data.frame [2 x 10]>
#> 10      91 <data.frame [2 x 10]>
#> # ... with 40 more rows
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/worrms/issues).
* License: MIT
* Get citation information for `worrms` in R doing `citation(package = 'worrms')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.
