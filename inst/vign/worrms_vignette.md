<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{Introduction to the worrms package}
%\VignetteEncoding{UTF-8}
-->



Introduction to the worrms package
==================================

`worrms` is an R client for the [World Register of Marine Species](http://www.marinespecies.org/).

See the [taxize book](https://ropensci.github.io/taxize-book/) for taxonomically focused work
in this and similar packages.

## Install

Stable version from CRAN


```r
install.packages("worrms")
```

Development version from GitHub


```r
install.packages("devtools")
devtools::install_github("ropensci/worrms")
```


```r
library("worrms")
```

## Get records

WoRMS 'records' are taxa, not specimen occurrences or something else.

by date


```r
wm_records_date('2016-12-23T05:59:45+00:00')
#> # A tibble: 50 x 25
#>    AphiaID url   scientificname authority status unacceptreason rank 
#>      <int> <chr> <chr>          <chr>     <chr>  <lgl>          <chr>
#>  1  894302 http… Paleopolymorp… Vasilenk… accep… NA             Spec…
#>  2  894296 http… Parapachyphlo… Miklukho… accep… NA             Spec…
#>  3  894298 http… Parapachyphlo… Miklukho… accep… NA             Spec…
#>  4  894301 http… Ovulina radia… Seguenza… accep… NA             Spec…
#>  5  894299 http… Parafissurina… Petri, 1… accep… NA             Spec…
#>  6  894297 http… Parapachyphlo… Miklukho… accep… NA             Spec…
#>  7  894303 http… Anomalina nod… Terquem,… accep… NA             Spec…
#>  8  908243 http… Linderina kol… Singh, 1… accep… NA             Spec…
#>  9  901296 http… Pseudoreichel… Ueno, 19… accep… NA             Spec…
#> 10  901957 http… Gaudryinella … Moullade… accep… NA             Spec…
#> # … with 40 more rows, and 18 more variables: valid_AphiaID <int>,
#> #   valid_name <chr>, valid_authority <chr>, kingdom <chr>, phylum <chr>,
#> #   class <chr>, order <chr>, family <chr>, genus <chr>, citation <chr>,
#> #   lsid <chr>, isMarine <int>, isBrackish <lgl>, isFreshwater <lgl>,
#> #   isTerrestrial <lgl>, isExtinct <int>, match_type <chr>, modified <chr>
```

by a taxonomic name


```r
wm_records_name(name = 'Platanista gangetica')
#> # A tibble: 3 x 25
#>   AphiaID url   scientificname authority status unacceptreason rank 
#>     <int> <chr> <chr>          <chr>     <chr>  <lgl>          <chr>
#> 1  254967 http… Platanista ga… (Lebeck,… accep… NA             Spec…
#> 2  383571 http… Platanista ga… Roxburgh… accep… NA             Subs…
#> 3  254969 http… Platanista ga… Owen, 18… accep… NA             Subs…
#> # … with 18 more variables: valid_AphiaID <int>, valid_name <chr>,
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
#>   AphiaID url   scientificname authority status unacceptreason rank 
#>     <int> <chr> <chr>          <chr>     <chr>  <lgl>          <chr>
#> 1  254967 http… Platanista ga… (Lebeck,… accep… NA             Spec…
#> # … with 18 more variables: valid_AphiaID <int>, valid_name <chr>,
#> #   valid_authority <chr>, kingdom <chr>, phylum <chr>, class <chr>,
#> #   order <chr>, family <chr>, genus <chr>, citation <chr>, lsid <chr>,
#> #   isMarine <lgl>, isBrackish <lgl>, isFreshwater <int>,
#> #   isTerrestrial <lgl>, isExtinct <lgl>, match_type <chr>, modified <chr>
#> 
#> [[2]]
#> # A tibble: 2 x 25
#>   AphiaID url   scientificname authority status unacceptreason rank 
#>     <int> <chr> <chr>          <chr>     <chr>  <chr>          <chr>
#> 1  125960 http… Coryphaena     Linnaeus… accep… <NA>           Genus
#> 2  843430 <NA>  <NA>           <NA>      quara… synonym        <NA> 
#> # … with 18 more variables: valid_AphiaID <int>, valid_name <chr>,
#> #   valid_authority <chr>, kingdom <chr>, phylum <chr>, class <chr>,
#> #   order <chr>, family <chr>, genus <chr>, citation <chr>, lsid <chr>,
#> #   isMarine <int>, isBrackish <int>, isFreshwater <int>,
#> #   isTerrestrial <int>, isExtinct <lgl>, match_type <chr>, modified <chr>
```

by common name


```r
wm_records_common(name = 'clam')
#> # A tibble: 4 x 25
#>   AphiaID url   scientificname authority status unacceptreason rank 
#>     <int> <chr> <chr>          <chr>     <chr>  <lgl>          <chr>
#> 1  141919 http… Mercenaria me… (Linnaeu… accep… NA             Spec…
#> 2  140431 http… Mya truncata   Linnaeus… accep… NA             Spec…
#> 3  141936 http… Venus verruco… Linnaeus… accep… NA             Spec…
#> 4  575771 http… Verpa penis    (Linnaeu… accep… NA             Spec…
#> # … with 18 more variables: valid_AphiaID <int>, valid_name <chr>,
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
#>   AphiaID url   scientificname authority status unacceptreason rank 
#>     <int> <chr> <chr>          <chr>     <chr>  <lgl>          <chr>
#> 1  254967 http… Platanista ga… (Lebeck,… accep… NA             Spec…
#> # … with 18 more variables: valid_AphiaID <int>, valid_name <chr>,
#> #   valid_authority <chr>, kingdom <chr>, phylum <chr>, class <chr>,
#> #   order <chr>, family <chr>, genus <chr>, citation <chr>, lsid <chr>,
#> #   isMarine <lgl>, isBrackish <lgl>, isFreshwater <int>,
#> #   isTerrestrial <lgl>, isExtinct <lgl>, match_type <chr>, modified <chr>
```

## APHIA ID <--> name


```r
wm_name2id(name = "Rhincodon")
#> [1] 105749
```


```r
wm_id2name(id = 105706)
#> [1] "Rhincodontidae"
```

## Get AphiaID via an external ID


```r
wm_external(id = 1080)
#> [1] 85257
wm_external(id = 105706)
#> [1] 159854
```

## Get vernacular names from an AphiaID


```r
wm_common_id(id = 156806)
#> # A tibble: 2 x 3
#>   vernacular          language_code language
#>   <chr>               <chr>         <chr>   
#> 1 gilded wedgeclam    eng           English 
#> 2 Turton's wedge clam eng           English
```

## Children

Get direct taxonomic children for an AphiaID


```r
wm_classification(id = 105706)
#> # A tibble: 11 x 3
#>    AphiaID rank       scientificname  
#>      <int> <chr>      <chr>           
#>  1       2 Kingdom    Animalia        
#>  2    1821 Phylum     Chordata        
#>  3  146419 Subphylum  Vertebrata      
#>  4    1828 Superclass Gnathostomata   
#>  5   11676 Superclass Pisces          
#>  6   10193 Class      Elasmobranchii  
#>  7  368407 Subclass   Neoselachii     
#>  8  368408 Infraclass Selachii        
#>  9  368410 Superorder Galeomorphi     
#> 10   10208 Order      Orectolobiformes
#> 11  105706 Family     Rhincodontidae
```

## Classification

Get classification for an AphiaID


```r
wm_classification(id = 105706)
#> # A tibble: 11 x 3
#>    AphiaID rank       scientificname  
#>      <int> <chr>      <chr>           
#>  1       2 Kingdom    Animalia        
#>  2    1821 Phylum     Chordata        
#>  3  146419 Subphylum  Vertebrata      
#>  4    1828 Superclass Gnathostomata   
#>  5   11676 Superclass Pisces          
#>  6   10193 Class      Elasmobranchii  
#>  7  368407 Subclass   Neoselachii     
#>  8  368408 Infraclass Selachii        
#>  9  368410 Superorder Galeomorphi     
#> 10   10208 Order      Orectolobiformes
#> 11  105706 Family     Rhincodontidae
```

## Synonyms

Get synonyms for an AphiaID


```r
wm_synonyms(id = 105706)
#> # A tibble: 1 x 25
#>   AphiaID url   scientificname authority status unacceptreason rank 
#>     <int> <chr> <chr>          <chr>     <chr>  <chr>          <chr>
#> 1  148832 http… Rhiniodontidae Müller &… unacc… synonym        Fami…
#> # … with 18 more variables: valid_AphiaID <int>, valid_name <chr>,
#> #   valid_authority <chr>, kingdom <chr>, phylum <chr>, class <chr>,
#> #   order <chr>, family <chr>, genus <lgl>, citation <chr>, lsid <chr>,
#> #   isMarine <lgl>, isBrackish <lgl>, isFreshwater <lgl>,
#> #   isTerrestrial <lgl>, isExtinct <lgl>, match_type <chr>, modified <chr>
```

