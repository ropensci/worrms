worrms
======



<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![cran checks](https://cranchecks.info/badges/worst/worrms)](https://cranchecks.info/pkgs/worrms)
[![Build Status](https://travis-ci.org/ropensci/worrms.svg?branch=master)](https://travis-ci.org/ropensci/worrms)
[![Build status](https://ci.appveyor.com/api/projects/status/e5q7fi97pl49h7v6?svg=true)](https://ci.appveyor.com/project/sckott/worrms)
[![codecov](https://codecov.io/gh/ropensci/worrms/branch/master/graph/badge.svg)](https://codecov.io/gh/ropensci/worrms)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/worrms)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/worrms)](https://cran.r-project.org/package=worrms)

`worrms` is a R client for the World Register of Marine Species

* [World Register of Marine Species (WoRMS)](http://www.marinespecies.org/)
* [WoRMS REST API docs](http://www.marinespecies.org/rest/)

See the [taxize book](https://taxize.dev) for taxonomically focused work
in this and similar packages.

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
#> # A tibble: 50 x 27
#>    AphiaID url   scientificname authority status unacceptreason taxonRankID
#>      <int> <chr> <chr>          <chr>     <chr>  <lgl>                <int>
#>  1  894302 http… Paleopolymorp… Vasilenk… accep… NA                     220
#>  2  894296 http… Parapachyphlo… Miklukho… accep… NA                     220
#>  3  894298 http… Parapachyphlo… Miklukho… accep… NA                     220
#>  4  894301 http… Ovulina radia… Seguenza… accep… NA                     220
#>  5  894299 http… Parafissurina… Petri, 1… accep… NA                     220
#>  6  894297 http… Parapachyphlo… Miklukho… accep… NA                     220
#>  7  894303 http… Anomalina nod… Terquem,… accep… NA                     220
#>  8  908243 http… Linderina kol… Singh, 1… accep… NA                     220
#>  9  901296 http… Pseudoreichel… Ueno, 19… accep… NA                     220
#> 10  924662 http… Oolina virgula Terquem,… accep… NA                     220
#> # … with 40 more rows, and 20 more variables: rank <chr>,
#> #   valid_AphiaID <int>, valid_name <chr>, valid_authority <chr>,
#> #   parentNameUsageID <int>, kingdom <chr>, phylum <chr>, class <chr>,
#> #   order <chr>, family <chr>, genus <chr>, citation <chr>, lsid <chr>,
#> #   isMarine <int>, isBrackish <lgl>, isFreshwater <lgl>,
#> #   isTerrestrial <lgl>, isExtinct <int>, match_type <chr>, modified <chr>
```

by a taxonomic name


```r
wm_records_name(name = 'Leucophaeus')
#> # A tibble: 2 x 27
#>   AphiaID url   scientificname authority status unacceptreason taxonRankID
#>     <int> <chr> <chr>          <chr>     <chr>  <lgl>                <int>
#> 1  343613 http… Leucophaeus    <NA>      accep… NA                     180
#> 2  344089 http… Leucophaeus s… Traill, … accep… NA                     220
#> # … with 20 more variables: rank <chr>, valid_AphiaID <int>,
#> #   valid_name <chr>, valid_authority <chr>, parentNameUsageID <int>,
#> #   kingdom <chr>, phylum <chr>, class <chr>, order <chr>, family <chr>,
#> #   genus <chr>, citation <chr>, lsid <chr>, isMarine <int>,
#> #   isBrackish <lgl>, isFreshwater <lgl>, isTerrestrial <lgl>,
#> #   isExtinct <lgl>, match_type <chr>, modified <chr>
```

by many names


```r
wm_records_names(name = c('Platanista gangetica', 'Coryphaena'))
#> [[1]]
#> # A tibble: 0 x 0
#> 
#> [[2]]
#> # A tibble: 2 x 27
#>   AphiaID url   scientificname authority status unacceptreason taxonRankID
#>     <int> <chr> <chr>          <chr>     <chr>  <chr>                <int>
#> 1  125960 http… Coryphaena     Linnaeus… accep… <NA>                   180
#> 2  843430 <NA>  <NA>           <NA>      quara… synonym                 NA
#> # … with 20 more variables: rank <chr>, valid_AphiaID <int>,
#> #   valid_name <chr>, valid_authority <chr>, parentNameUsageID <int>,
#> #   kingdom <chr>, phylum <chr>, class <chr>, order <chr>, family <chr>,
#> #   genus <chr>, citation <chr>, lsid <chr>, isMarine <int>,
#> #   isBrackish <int>, isFreshwater <int>, isTerrestrial <int>,
#> #   isExtinct <lgl>, match_type <chr>, modified <chr>
```

by common name


```r
wm_records_common(name = 'clam')
#> # A tibble: 4 x 27
#>   AphiaID url   scientificname authority status unacceptreason taxonRankID
#>     <int> <chr> <chr>          <chr>     <chr>  <lgl>                <int>
#> 1  141919 http… Mercenaria me… (Linnaeu… accep… NA                     220
#> 2  140431 http… Mya truncata   Linnaeus… accep… NA                     220
#> 3  141936 http… Venus verruco… Linnaeus… accep… NA                     220
#> 4  575771 http… Verpa penis    (Linnaeu… accep… NA                     220
#> # … with 20 more variables: rank <chr>, valid_AphiaID <int>,
#> #   valid_name <chr>, valid_authority <chr>, parentNameUsageID <int>,
#> #   kingdom <chr>, phylum <chr>, class <chr>, order <chr>, family <chr>,
#> #   genus <chr>, citation <chr>, lsid <chr>, isMarine <int>,
#> #   isBrackish <lgl>, isFreshwater <lgl>, isTerrestrial <lgl>,
#> #   isExtinct <lgl>, match_type <chr>, modified <chr>
```

using the TAXMATCH algorithm


```r
wm_records_taxamatch(name = 'Leucophaeus')
#> [[1]]
#> # A tibble: 1 x 27
#>   AphiaID url   scientificname authority status unacceptreason taxonRankID
#>     <int> <chr> <chr>          <lgl>     <chr>  <lgl>                <int>
#> 1  343613 http… Leucophaeus    NA        accep… NA                     180
#> # … with 20 more variables: rank <chr>, valid_AphiaID <int>,
#> #   valid_name <chr>, valid_authority <lgl>, parentNameUsageID <int>,
#> #   kingdom <chr>, phylum <chr>, class <chr>, order <chr>, family <chr>,
#> #   genus <chr>, citation <chr>, lsid <chr>, isMarine <int>,
#> #   isBrackish <lgl>, isFreshwater <lgl>, isTerrestrial <lgl>,
#> #   isExtinct <lgl>, match_type <chr>, modified <chr>
```

## attributes (i.e., traits)

attribute definition by ID


```r
wm_attr_def(id = 1)
#> # A tibble: 1 x 4
#>   measurementTypeID measurementType        CategoryID children        
#>               <int> <chr>                       <int> <list>          
#> 1                 1 IUCN Red List Category          1 <df[,4] [2 × 4]>
```

attribute data by AphiaID


```r
wm_attr_data(id = 127160)
#> # A tibble: 25 x 10
#>    AphiaID measurementType… measurementType measurementValue source_id
#>    <chr>              <int> <chr>           <chr>                <int>
#>  1 127160                23 Species import… FAO-ASFIS: Spec…    197354
#>  2 127160                23 Species import… MSFD indicators     197546
#>  3 127160                23 Species import… MSFD indicators     197549
#>  4 127160                23 Species import… MSFD indicators     197615
#>  5 127160                23 Species import… MSFD indicators     197615
#>  6 127160                23 Species import… MSFD indicators     197615
#>  7 127160                23 Species import… MSFD indicators     197615
#>  8 127160                23 Species import… MSFD indicators     197616
#>  9 127160                23 Species import… MSFD indicators     197616
#> 10 127160                23 Species import… MSFD indicators     197549
#> # … with 15 more rows, and 5 more variables: reference <chr>,
#> #   qualitystatus <chr>, AphiaID_Inherited <int>, CategoryID <int>,
#> #   children <list>
```

attributes grouped by a CategoryID


```r
wm_attr_category(id = 7)
#> # A tibble: 6 x 4
#>   measurementValueID measurementValue measurementValueCode children        
#>                <int> <chr>            <chr>                <list>          
#> 1                183 benthos          <NA>                 <df[,4] [6 × 4]>
#> 2                184 plankton         <NA>                 <df[,4] [2 × 4]>
#> 3                194 nekton           <NA>                 <df[,0] [0 × 0]>
#> 4                323 neuston          <NA>                 <df[,0] [0 × 0]>
#> 5                378 edaphofauna      <NA>                 <df[,4] [2 × 4]>
#> 6                331 not applicable   N/A                  <df[,0] [0 × 0]>
```

AphiaIDs by attribute definition ID


```r
wm_attr_aphia(id = 4)
#> # A tibble: 50 x 2
#>    AphiaID Attributes        
#>      <int> <list>            
#>  1      11 <df[,10] [1 × 10]>
#>  2      55 <df[,10] [2 × 10]>
#>  3      57 <df[,10] [2 × 10]>
#>  4      58 <df[,10] [2 × 10]>
#>  5      59 <df[,10] [2 × 10]>
#>  6      63 <df[,10] [2 × 10]>
#>  7      64 <df[,10] [2 × 10]>
#>  8      69 <df[,10] [2 × 10]>
#>  9      90 <df[,10] [2 × 10]>
#> 10      91 <df[,10] [2 × 10]>
#> # … with 40 more rows
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/worrms/issues).
* License: MIT
* Get citation information for `worrms` in R doing `citation(package = 'worrms')`
* Please note that this project is released with a [Contributor Code of Conduct][coc].
By participating in this project you agree to abide by its terms.

[![rofooter](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)

[coc]: https://github.com/ropensci/worrms/blob/master/CODE_OF_CONDUCT.md
