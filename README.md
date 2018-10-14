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
#>    AphiaID url       scientificname  authority status unacceptreason rank 
#>  *   <int> <chr>     <chr>           <chr>     <chr>  <lgl>          <chr>
#>  1  894298 http://w… Parapachyphloi… Miklukho… accep… NA             Spec…
#>  2  894301 http://w… Ovulina radiata Seguenza… accep… NA             Spec…
#>  3  894297 http://w… Parapachyphloi… Miklukho… accep… NA             Spec…
#>  4  894302 http://w… Paleopolymorph… Vasilenk… accep… NA             Spec…
#>  5  894296 http://w… Parapachyphloi… Miklukho… accep… NA             Spec…
#>  6  894299 http://w… Parafissurina … Petri, 1… accep… NA             Spec…
#>  7  894303 http://w… Anomalina nodu… Terquem,… accep… NA             Spec…
#>  8  901957 http://w… Gaudryinella e… Moullade… accep… NA             Spec…
#>  9  916899 http://w… Gavelinella pu… Porthaul… accep… NA             Spec…
#> 10  925289 http://w… Textularia yat… Murata, … accep… NA             Spec…
#> # ... with 40 more rows, and 18 more variables: valid_AphiaID <int>,
#> #   valid_name <chr>, valid_authority <chr>, kingdom <chr>, phylum <chr>,
#> #   class <chr>, order <chr>, family <chr>, genus <chr>, citation <chr>,
#> #   lsid <chr>, isMarine <int>, isBrackish <lgl>, isFreshwater <lgl>,
#> #   isTerrestrial <lgl>, isExtinct <int>, match_type <chr>, modified <chr>
```

by a taxonomic name
([taxize book](https://ropensci.github.io/taxize-book/))

```r
wm_records_name(name = 'Platanista gangetica')
#> # A tibble: 3 x 25
#>   AphiaID url       scientificname   authority status unacceptreason rank 
#> *   <int> <chr>     <chr>            <chr>     <chr>  <lgl>          <chr>
#> 1  254967 http://w… Platanista gang… (Lebeck,… accep… NA             Spec…
#> 2  383571 http://w… Platanista gang… Roxburgh… accep… NA             Subs…
#> 3  254969 http://w… Platanista gang… Owen, 18… accep… NA             Subs…
#> # ... with 18 more variables: valid_AphiaID <int>, valid_name <chr>,
#> #   valid_authority <chr>, kingdom <chr>, phylum <chr>, class <chr>,
#> #   order <chr>, family <chr>, genus <chr>, citation <chr>, lsid <chr>,
#> #   isMarine <int>, isBrackish <lgl>, isFreshwater <int>,
#> #   isTerrestrial <int>, isExtinct <lgl>, match_type <chr>, modified <chr>
```

by many names


```r
wm_records_names(name = c('Platanista gangetica', 'Coryphaena'))
#> [[1]]
#> # A tibble: 1 x 25
#>   AphiaID url        scientificname  authority status unacceptreason rank 
#> *   <int> <chr>      <chr>           <chr>     <chr>  <lgl>          <chr>
#> 1  254967 http://ww… Platanista gan… (Lebeck,… accep… NA             Spec…
#> # ... with 18 more variables: valid_AphiaID <int>, valid_name <chr>,
#> #   valid_authority <chr>, kingdom <chr>, phylum <chr>, class <chr>,
#> #   order <chr>, family <chr>, genus <chr>, citation <chr>, lsid <chr>,
#> #   isMarine <lgl>, isBrackish <lgl>, isFreshwater <int>,
#> #   isTerrestrial <lgl>, isExtinct <lgl>, match_type <chr>, modified <chr>
#> 
#> [[2]]
#> # A tibble: 2 x 25
#>   AphiaID url         scientificname authority status unacceptreason rank 
#> *   <int> <chr>       <chr>          <chr>     <chr>  <chr>          <chr>
#> 1  125960 http://www… Coryphaena     Linnaeus… accep… <NA>           Genus
#> 2  843430 <NA>        <NA>           <NA>      quara… synonym        <NA> 
#> # ... with 18 more variables: valid_AphiaID <int>, valid_name <chr>,
#> #   valid_authority <chr>, kingdom <chr>, phylum <chr>, class <chr>,
#> #   order <chr>, family <chr>, genus <chr>, citation <chr>, lsid <chr>,
#> #   isMarine <int>, isBrackish <int>, isFreshwater <int>,
#> #   isTerrestrial <int>, isExtinct <lgl>, match_type <chr>, modified <chr>
```

by common name


```r
wm_records_common(name = 'clam')
#> # A tibble: 2 x 25
#>   AphiaID url        scientificname  authority status unacceptreason rank 
#> *   <int> <chr>      <chr>           <chr>     <chr>  <lgl>          <chr>
#> 1  141919 http://ww… Mercenaria mer… (Linnaeu… accep… NA             Spec…
#> 2  141936 http://ww… Venus verrucosa Linnaeus… accep… NA             Spec…
#> # ... with 18 more variables: valid_AphiaID <int>, valid_name <chr>,
#> #   valid_authority <chr>, kingdom <chr>, phylum <chr>, class <chr>,
#> #   order <chr>, family <chr>, genus <chr>, citation <chr>, lsid <chr>,
#> #   isMarine <int>, isBrackish <lgl>, isFreshwater <lgl>,
#> #   isTerrestrial <lgl>, isExtinct <lgl>, match_type <chr>, modified <chr>
```

using the TAXMATCH algorithm


```r
wm_records_taxamatch(name = 'Platanista gangetica')
#> [[1]]
#> # A tibble: 1 x 25
#>   AphiaID url        scientificname  authority status unacceptreason rank 
#> *   <int> <chr>      <chr>           <chr>     <chr>  <lgl>          <chr>
#> 1  254967 http://ww… Platanista gan… (Lebeck,… accep… NA             Spec…
#> # ... with 18 more variables: valid_AphiaID <int>, valid_name <chr>,
#> #   valid_authority <chr>, kingdom <chr>, phylum <chr>, class <chr>,
#> #   order <chr>, family <chr>, genus <chr>, citation <chr>, lsid <chr>,
#> #   isMarine <lgl>, isBrackish <lgl>, isFreshwater <int>,
#> #   isTerrestrial <lgl>, isExtinct <lgl>, match_type <chr>, modified <chr>
```

## attributes (i.e., traits)

attribute definition by ID


```r
wm_attr_def(id = 1)
#> # A tibble: 1 x 4
#>   measurementTypeID measurementType        CategoryID children            
#> *             <int> <chr>                       <int> <list>              
#> 1                 1 IUCN Red List Category          1 <data.frame [2 × 4]>
```

attribute data by AphiaID


```r
wm_attr_data(id = 127160)
#> # A tibble: 24 x 10
#>    AphiaID measurementTypeID measurementType  measurementValue   source_id
#>  * <chr>               <int> <chr>            <chr>                  <int>
#>  1 127160                 23 Species importa… FAO-ASFIS: Specie…    197354
#>  2 127160                 23 Species importa… MSFD indicators       197546
#>  3 127160                 23 Species importa… MSFD indicators       197549
#>  4 127160                 23 Species importa… MSFD indicators       197615
#>  5 127160                 23 Species importa… MSFD indicators       197615
#>  6 127160                 23 Species importa… MSFD indicators       197615
#>  7 127160                 23 Species importa… MSFD indicators       197615
#>  8 127160                 23 Species importa… MSFD indicators       197616
#>  9 127160                 23 Species importa… MSFD indicators       197616
#> 10 127160                 23 Species importa… MSFD indicators       197549
#> # ... with 14 more rows, and 5 more variables: reference <chr>,
#> #   qualitystatus <chr>, AphiaID_Inherited <int>, CategoryID <int>,
#> #   children <list>
```

attributes grouped by a CategoryID


```r
wm_attr_category(id = 7)
#> # A tibble: 5 x 4
#>   measurementValueID measurementValue measurementValueCode children       
#> *              <int> <chr>            <chr>                <list>         
#> 1                183 benthos          <NA>                 <data.frame [6…
#> 2                184 plankton         <NA>                 <data.frame [2…
#> 3                194 nekton           <NA>                 <data.frame [0…
#> 4                323 neuston          <NA>                 <data.frame [0…
#> 5                331 not applicable   N/A                  <data.frame [0…
```

AphiaIDs by attribute definition ID


```r
wm_attr_aphia(id = 4)
#> # A tibble: 50 x 2
#>    AphiaID Attributes           
#>  *   <int> <list>               
#>  1      11 <data.frame [1 × 10]>
#>  2      55 <data.frame [2 × 10]>
#>  3      57 <data.frame [2 × 10]>
#>  4      58 <data.frame [2 × 10]>
#>  5      59 <data.frame [2 × 10]>
#>  6      63 <data.frame [2 × 10]>
#>  7      64 <data.frame [2 × 10]>
#>  8      69 <data.frame [2 × 10]>
#>  9      90 <data.frame [2 × 10]>
#> 10      91 <data.frame [2 × 10]>
#> # ... with 40 more rows
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/worrms/issues).
* License: MIT
* Get citation information for `worrms` in R doing `citation(package = 'worrms')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.
