worrms
======



[![Build Status](https://travis-ci.org/ropensci/worrms.svg?branch=master)](https://travis-ci.org/ropensci/worrms)

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
#>    AphiaID                                                           url
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
#> 11  913155 http://www.marinespecies.org/aphia.php?p=taxdetails&id=913155
#> 12  901957 http://www.marinespecies.org/aphia.php?p=taxdetails&id=901957
#> 13  899919 http://www.marinespecies.org/aphia.php?p=taxdetails&id=899919
#> 14  916899 http://www.marinespecies.org/aphia.php?p=taxdetails&id=916899
#> 15  925289 http://www.marinespecies.org/aphia.php?p=taxdetails&id=925289
#> 16  920852 http://www.marinespecies.org/aphia.php?p=taxdetails&id=920852
#> 17  912385 http://www.marinespecies.org/aphia.php?p=taxdetails&id=912385
#> 18  908309 http://www.marinespecies.org/aphia.php?p=taxdetails&id=908309
#> 19  920775 http://www.marinespecies.org/aphia.php?p=taxdetails&id=920775
#> 20  921920 http://www.marinespecies.org/aphia.php?p=taxdetails&id=921920
#> 21  911824 http://www.marinespecies.org/aphia.php?p=taxdetails&id=911824
#> 22  906437 http://www.marinespecies.org/aphia.php?p=taxdetails&id=906437
#> 23  923749 http://www.marinespecies.org/aphia.php?p=taxdetails&id=923749
#> 24  906846 http://www.marinespecies.org/aphia.php?p=taxdetails&id=906846
#> 25  909777 http://www.marinespecies.org/aphia.php?p=taxdetails&id=909777
#> 26  898588 http://www.marinespecies.org/aphia.php?p=taxdetails&id=898588
#> 27  896945 http://www.marinespecies.org/aphia.php?p=taxdetails&id=896945
#> 28  907616 http://www.marinespecies.org/aphia.php?p=taxdetails&id=907616
#> 29  916338 http://www.marinespecies.org/aphia.php?p=taxdetails&id=916338
#> 30  905667 http://www.marinespecies.org/aphia.php?p=taxdetails&id=905667
#> 31  903872 http://www.marinespecies.org/aphia.php?p=taxdetails&id=903872
#> 32  920082 http://www.marinespecies.org/aphia.php?p=taxdetails&id=920082
#> 33  909411 http://www.marinespecies.org/aphia.php?p=taxdetails&id=909411
#> 34  921877 http://www.marinespecies.org/aphia.php?p=taxdetails&id=921877
#> 35  898817 http://www.marinespecies.org/aphia.php?p=taxdetails&id=898817
#> 36  903059 http://www.marinespecies.org/aphia.php?p=taxdetails&id=903059
#> 37  922690 http://www.marinespecies.org/aphia.php?p=taxdetails&id=922690
#> 38  913925 http://www.marinespecies.org/aphia.php?p=taxdetails&id=913925
#> 39  899358 http://www.marinespecies.org/aphia.php?p=taxdetails&id=899358
#> 40  914466 http://www.marinespecies.org/aphia.php?p=taxdetails&id=914466
#>                        scientificname                       authority
#> 1              Parapachyphloia minuta                     Zheng, 1979
#> 2         Parapachyphloia asymmetrica           Miklukho-maklay, 1954
#> 3             Parapachyphloia radiata                  Seguenza, 1862
#> 4             Parapachyphloia adducta           Miklukho-maklay, 1954
#> 5                Parapachyphloia rara                 Vasilenko, 1961
#> 6           Parapachyphloia abagensis           Miklukho-maklay, 1954
#> 7       Parapachyphloia hemisphaerica                     Petri, 1957
#> 8                 Dendrotuba nodulosa                   Terquem, 1875
#> 9                Verneuilina decorata                     Brady, 1884
#> 10 Globigerinelloides burlingtonensis                   Petters, 1977
#> 11               Triloculina oceanica          Cushman & Parker, 1947
#> 12            Lenticulina eichenbergi                  Moullade, 1966
#> 13                  Cibicides croarae                    Conato, 1964
#> 14            Cristellaria pugetensis                 Porthault, 1970
#> 15        Planomalina yatsushiroensis                    Murata, 1951
#> 16                Anomalina stellaris                 Ehrenberg, 1854
#> 17            Fusulinella nevadaensis        Douglass & Nestell, 1974
#> 18         Rectuvigerina krachemensis             Magne & Sigal, 1954
#> 19             Frondicularia stabilis                     Zheng, 1988
#> 20               Vaginulina sulzensis                   Andreae, 1884
#> 21             Polymorphina mucronata               Conil & Lys, 1964
#> 22         Haplophragmoides impressus          Kristan-tollmann, 1964
#> 23           Textulariella turkmenica       Morozova & Kuryleva, 1967
#> 24                  Valvulina inflata                    Franke, 1928
#> 25                Disonella lucasiana              Defrance Ms., 1850
#> 26                Globigerina cognata                Pishvanova, 1958
#> 27            Saracenaria blancoensis                     Bandy, 1944
#> 28                   Tritaxia jarvisi                   Cushman, 1936
#> 29                Polymorphina prisca                   Terquem, 1881
#> 30              Marginulina helvetica         Kuebler & Zwingli, 1870
#> 31                Ramulina fusiformis                     Zheng, 1979
#> 32          Cribrostomoides sinaensis             Said & Kenawy, 1956
#> 33               Rhabdammina linearis                    Roemer, 1841
#> 34               Glandulina suezensis                      Said, 1949
#> 35              Islandiella compressa                    Nomura, 1983
#> 36              Grammostomum fasciata                 Ehrenberg, 1845
#> 37              Bolivina tezhevaensis   Morozova & Kozhevnikova, 1967
#> 38            Dictyoconus pachyheilus                    Hadley, 1934
#> 39                    Planulina cornu                   Chapman, 1902
#> 40       Lepidocyclina partimbicincta                   Matthes, 1939
#>      status unacceptreason rank valid_AphiaID
#> 1  accepted             NA   NA        894300
#> 2  accepted             NA   NA        894298
#> 3  accepted             NA   NA        894301
#> 4  accepted             NA   NA        894297
#> 5  accepted             NA   NA        894302
#> 6  accepted             NA   NA        894296
#> 7  accepted             NA   NA        894299
#> 8  accepted             NA   NA        894303
#> 9  accepted             NA   NA        900689
#> 10 accepted             NA   NA        897486
#> 11 accepted             NA   NA        913155
#> 12 accepted             NA   NA        901957
#> 13 accepted             NA   NA        899919
#> 14 accepted             NA   NA        916899
#> 15 accepted             NA   NA        925289
#> 16 accepted             NA   NA        920852
#> 17 accepted             NA   NA        912385
#> 18 accepted             NA   NA        908309
#> 19 accepted             NA   NA        920775
#> 20 accepted             NA   NA        921920
#> 21 accepted             NA   NA        911824
#> 22 accepted             NA   NA        906437
#> 23 accepted             NA   NA        923749
#> 24 accepted             NA   NA        906846
#> 25 accepted             NA   NA        909777
#> 26 accepted             NA   NA        898588
#> 27 accepted             NA   NA        896945
#> 28 accepted             NA   NA        907616
#> 29 accepted             NA   NA        916338
#> 30 accepted             NA   NA        905667
#> 31 accepted             NA   NA        903872
#> 32 accepted             NA   NA        920082
#> 33 accepted             NA   NA        909411
#> 34 accepted             NA   NA        921877
#> 35 accepted             NA   NA        898817
#> 36 accepted             NA   NA        903059
#> 37 accepted             NA   NA        922690
#> 38 accepted             NA   NA        913925
#> 39 accepted             NA   NA        899358
#> 40 accepted             NA   NA        914466
#>                            valid_name                 valid_authority
#> 1              Parapachyphloia minuta                     Zheng, 1979
#> 2         Parapachyphloia asymmetrica           Miklukho-maklay, 1954
#> 3             Parapachyphloia radiata                  Seguenza, 1862
#> 4             Parapachyphloia adducta           Miklukho-maklay, 1954
#> 5                Parapachyphloia rara                 Vasilenko, 1961
#> 6           Parapachyphloia abagensis           Miklukho-maklay, 1954
#> 7       Parapachyphloia hemisphaerica                     Petri, 1957
#> 8                 Dendrotuba nodulosa                   Terquem, 1875
#> 9                Verneuilina decorata                     Brady, 1884
#> 10 Globigerinelloides burlingtonensis                   Petters, 1977
#> 11               Triloculina oceanica          Cushman & Parker, 1947
#> 12            Lenticulina eichenbergi                  Moullade, 1966
#> 13                  Cibicides croarae                    Conato, 1964
#> 14            Cristellaria pugetensis                 Porthault, 1970
#> 15        Planomalina yatsushiroensis                    Murata, 1951
#> 16                Anomalina stellaris                 Ehrenberg, 1854
#> 17            Fusulinella nevadaensis        Douglass & Nestell, 1974
#> 18         Rectuvigerina krachemensis             Magne & Sigal, 1954
#> 19             Frondicularia stabilis                     Zheng, 1988
#> 20               Vaginulina sulzensis                   Andreae, 1884
#> 21             Polymorphina mucronata               Conil & Lys, 1964
#> 22         Haplophragmoides impressus          Kristan-tollmann, 1964
#> 23           Textulariella turkmenica       Morozova & Kuryleva, 1967
#> 24                  Valvulina inflata                    Franke, 1928
#> 25                Disonella lucasiana              Defrance Ms., 1850
#> 26                Globigerina cognata                Pishvanova, 1958
#> 27            Saracenaria blancoensis                     Bandy, 1944
#> 28                   Tritaxia jarvisi                   Cushman, 1936
#> 29                Polymorphina prisca                   Terquem, 1881
#> 30              Marginulina helvetica         Kuebler & Zwingli, 1870
#> 31                Ramulina fusiformis                     Zheng, 1979
#> 32          Cribrostomoides sinaensis             Said & Kenawy, 1956
#> 33               Rhabdammina linearis                    Roemer, 1841
#> 34               Glandulina suezensis                      Said, 1949
#> 35              Islandiella compressa                    Nomura, 1983
#> 36              Grammostomum fasciata                 Ehrenberg, 1845
#> 37              Bolivina tezhevaensis   Morozova & Kozhevnikova, 1967
#> 38            Dictyoconus pachyheilus                    Hadley, 1934
#> 39                    Planulina cornu                   Chapman, 1902
#> 40       Lepidocyclina partimbicincta                   Matthes, 1939
#>    kingdom phylum class order family genus
#> 1       NA     NA    NA    NA     NA    NA
#> 2       NA     NA    NA    NA     NA    NA
#> 3       NA     NA    NA    NA     NA    NA
#> 4       NA     NA    NA    NA     NA    NA
#> 5       NA     NA    NA    NA     NA    NA
#> 6       NA     NA    NA    NA     NA    NA
#> 7       NA     NA    NA    NA     NA    NA
#> 8       NA     NA    NA    NA     NA    NA
#> 9       NA     NA    NA    NA     NA    NA
#> 10      NA     NA    NA    NA     NA    NA
#> 11      NA     NA    NA    NA     NA    NA
#> 12      NA     NA    NA    NA     NA    NA
#> 13      NA     NA    NA    NA     NA    NA
#> 14      NA     NA    NA    NA     NA    NA
#> 15      NA     NA    NA    NA     NA    NA
#> 16      NA     NA    NA    NA     NA    NA
#> 17      NA     NA    NA    NA     NA    NA
#> 18      NA     NA    NA    NA     NA    NA
#> 19      NA     NA    NA    NA     NA    NA
#> 20      NA     NA    NA    NA     NA    NA
#> 21      NA     NA    NA    NA     NA    NA
#> 22      NA     NA    NA    NA     NA    NA
#> 23      NA     NA    NA    NA     NA    NA
#> 24      NA     NA    NA    NA     NA    NA
#> 25      NA     NA    NA    NA     NA    NA
#> 26      NA     NA    NA    NA     NA    NA
#> 27      NA     NA    NA    NA     NA    NA
#> 28      NA     NA    NA    NA     NA    NA
#> 29      NA     NA    NA    NA     NA    NA
#> 30      NA     NA    NA    NA     NA    NA
#> 31      NA     NA    NA    NA     NA    NA
#> 32      NA     NA    NA    NA     NA    NA
#> 33      NA     NA    NA    NA     NA    NA
#> 34      NA     NA    NA    NA     NA    NA
#> 35      NA     NA    NA    NA     NA    NA
#> 36      NA     NA    NA    NA     NA    NA
#> 37      NA     NA    NA    NA     NA    NA
#> 38      NA     NA    NA    NA     NA    NA
#> 39      NA     NA    NA    NA     NA    NA
#> 40      NA     NA    NA    NA     NA    NA
#>                                                                                                                                                                                                                                                                                    citation
#> 1              Hayward, B. (2016). Parapachyphloia minuta. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=894300 on 2016-12-23
#> 2         Hayward, B. (2016). Parapachyphloia asymmetrica. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=894298 on 2016-12-23
#> 3             Hayward, B. (2016). Parapachyphloia radiata. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=894301 on 2016-12-23
#> 4             Hayward, B. (2016). Parapachyphloia adducta. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=894297 on 2016-12-23
#> 5                Hayward, B. (2016). Parapachyphloia rara. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=894302 on 2016-12-23
#> 6           Hayward, B. (2016). Parapachyphloia abagensis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=894296 on 2016-12-23
#> 7       Hayward, B. (2016). Parapachyphloia hemisphaerica. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=894299 on 2016-12-23
#> 8                 Hayward, B. (2016). Dendrotuba nodulosa. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=894303 on 2016-12-23
#> 9                Hayward, B. (2016). Verneuilina decorata. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=900689 on 2016-12-23
#> 10 Hayward, B. (2016). Globigerinelloides burlingtonensis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=897486 on 2016-12-23
#> 11               Hayward, B. (2016). Triloculina oceanica. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=913155 on 2016-12-23
#> 12            Hayward, B. (2016). Lenticulina eichenbergi. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=901957 on 2016-12-23
#> 13                  Hayward, B. (2016). Cibicides croarae. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=899919 on 2016-12-23
#> 14            Hayward, B. (2016). Cristellaria pugetensis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=916899 on 2016-12-23
#> 15        Hayward, B. (2016). Planomalina yatsushiroensis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=925289 on 2016-12-23
#> 16                Hayward, B. (2016). Anomalina stellaris. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=920852 on 2016-12-23
#> 17            Hayward, B. (2016). Fusulinella nevadaensis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=912385 on 2016-12-23
#> 18         Hayward, B. (2016). Rectuvigerina krachemensis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=908309 on 2016-12-23
#> 19             Hayward, B. (2016). Frondicularia stabilis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=920775 on 2016-12-23
#> 20               Hayward, B. (2016). Vaginulina sulzensis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=921920 on 2016-12-23
#> 21             Hayward, B. (2016). Polymorphina mucronata. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=911824 on 2016-12-23
#> 22         Hayward, B. (2016). Haplophragmoides impressus. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=906437 on 2016-12-23
#> 23           Hayward, B. (2016). Textulariella turkmenica. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=923749 on 2016-12-23
#> 24                  Hayward, B. (2016). Valvulina inflata. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=906846 on 2016-12-23
#> 25                Hayward, B. (2016). Disonella lucasiana. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=909777 on 2016-12-23
#> 26                                                                                                                                                                                                                                                                            on 2016-12-23
#> 27            Hayward, B. (2016). Saracenaria blancoensis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=896945 on 2016-12-23
#> 28                   Hayward, B. (2016). Tritaxia jarvisi. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=907616 on 2016-12-23
#> 29                Hayward, B. (2016). Polymorphina prisca. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=916338 on 2016-12-23
#> 30              Hayward, B. (2016). Marginulina helvetica. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=905667 on 2016-12-23
#> 31                Hayward, B. (2016). Ramulina fusiformis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=903872 on 2016-12-23
#> 32          Hayward, B. (2016). Cribrostomoides sinaensis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=920082 on 2016-12-23
#> 33               Hayward, B. (2016). Rhabdammina linearis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=909411 on 2016-12-23
#> 34               Hayward, B. (2016). Glandulina suezensis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=921877 on 2016-12-23
#> 35              Hayward, B. (2016). Islandiella compressa. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=898817 on 2016-12-23
#> 36              Hayward, B. (2016). Grammostomum fasciata. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=903059 on 2016-12-23
#> 37              Hayward, B. (2016). Bolivina tezhevaensis. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=922690 on 2016-12-23
#> 38            Hayward, B. (2016). Dictyoconus pachyheilus. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=913925 on 2016-12-23
#> 39                    Hayward, B. (2016). Planulina cornu. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=899358 on 2016-12-23
#> 40       Hayward, B. (2016). Lepidocyclina partimbicincta. In: Hayward, B.W.; Cedhagen, T.; Kaminski, M.; Gross, O. (2016). World Foraminifera Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=914466 on 2016-12-23
#>                                         lsid isMarine isBrackish
#> 1  urn:lsid:marinespecies.org:taxname:894300        1         NA
#> 2  urn:lsid:marinespecies.org:taxname:894298        1         NA
#> 3  urn:lsid:marinespecies.org:taxname:894301        1         NA
#> 4  urn:lsid:marinespecies.org:taxname:894297        1         NA
#> 5  urn:lsid:marinespecies.org:taxname:894302        1         NA
#> 6  urn:lsid:marinespecies.org:taxname:894296        1         NA
#> 7  urn:lsid:marinespecies.org:taxname:894299        1         NA
#> 8  urn:lsid:marinespecies.org:taxname:894303        1         NA
#> 9  urn:lsid:marinespecies.org:taxname:900689        1         NA
#> 10 urn:lsid:marinespecies.org:taxname:897486        1         NA
#> 11 urn:lsid:marinespecies.org:taxname:913155        1         NA
#> 12 urn:lsid:marinespecies.org:taxname:901957        1         NA
#> 13 urn:lsid:marinespecies.org:taxname:899919        1         NA
#> 14 urn:lsid:marinespecies.org:taxname:916899        1         NA
#> 15 urn:lsid:marinespecies.org:taxname:925289        1         NA
#> 16 urn:lsid:marinespecies.org:taxname:920852        1         NA
#> 17 urn:lsid:marinespecies.org:taxname:912385        1         NA
#> 18 urn:lsid:marinespecies.org:taxname:908309        1         NA
#> 19 urn:lsid:marinespecies.org:taxname:920775        1         NA
#> 20 urn:lsid:marinespecies.org:taxname:921920        1         NA
#> 21 urn:lsid:marinespecies.org:taxname:911824        1         NA
#> 22 urn:lsid:marinespecies.org:taxname:906437        1         NA
#> 23 urn:lsid:marinespecies.org:taxname:923749        1         NA
#> 24 urn:lsid:marinespecies.org:taxname:906846        1         NA
#> 25 urn:lsid:marinespecies.org:taxname:909777        1         NA
#> 26 urn:lsid:marinespecies.org:taxname:898588        1         NA
#> 27 urn:lsid:marinespecies.org:taxname:896945        1         NA
#> 28 urn:lsid:marinespecies.org:taxname:907616        1         NA
#> 29 urn:lsid:marinespecies.org:taxname:916338        1         NA
#> 30 urn:lsid:marinespecies.org:taxname:905667        1         NA
#> 31 urn:lsid:marinespecies.org:taxname:903872        1         NA
#> 32 urn:lsid:marinespecies.org:taxname:920082        1         NA
#> 33 urn:lsid:marinespecies.org:taxname:909411        1         NA
#> 34 urn:lsid:marinespecies.org:taxname:921877        1         NA
#> 35 urn:lsid:marinespecies.org:taxname:898817        1         NA
#> 36 urn:lsid:marinespecies.org:taxname:903059        1         NA
#> 37 urn:lsid:marinespecies.org:taxname:922690        1         NA
#> 38 urn:lsid:marinespecies.org:taxname:913925        1         NA
#> 39 urn:lsid:marinespecies.org:taxname:899358        1         NA
#> 40 urn:lsid:marinespecies.org:taxname:914466        1         NA
#>    isFreshwater isTerrestrial isExtinct match_type             modified
#> 1            NA            NA         1      exact 2016-12-23T07:45:54Z
#> 2            NA            NA         1      exact 2016-12-23T07:45:54Z
#> 3            NA            NA         1      exact 2016-12-23T07:45:54Z
#> 4            NA            NA         1      exact 2016-12-23T07:45:54Z
#> 5            NA            NA         1      exact 2016-12-23T07:45:54Z
#> 6            NA            NA         1      exact 2016-12-23T07:45:54Z
#> 7            NA            NA         1      exact 2016-12-23T07:45:54Z
#> 8            NA            NA         1      exact 2016-12-23T08:00:56Z
#> 9            NA            NA         1      exact 2016-12-23T08:02:08Z
#> 10           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 11           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 12           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 13           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 14           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 15           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 16           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 17           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 18           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 19           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 20           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 21           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 22           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 23           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 24           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 25           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 26           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 27           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 28           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 29           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 30           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 31           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 32           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 33           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 34           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 35           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 36           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 37           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 38           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 39           NA            NA         1      exact 2016-12-23T08:02:08Z
#> 40           NA            NA         1      exact 2016-12-23T08:02:08Z
#>  [ reached getOption("max.print") -- omitted 10 rows ]
```

by a taxonomic name


```r
wm_records_name(name = 'Platanista gangetica')
#>   AphiaID                                                           url
#> 1  254967 http://www.marinespecies.org/aphia.php?p=taxdetails&id=254967
#> 2  383571 http://www.marinespecies.org/aphia.php?p=taxdetails&id=383571
#> 3  254969 http://www.marinespecies.org/aphia.php?p=taxdetails&id=254969
#>                   scientificname      authority   status unacceptreason
#> 1           Platanista gangetica (Lebeck, 1801) accepted             NA
#> 2 Platanista gangetica gangetica Roxburgh, 1801 accepted             NA
#> 3     Platanista gangetica minor     Owen, 1853 accepted             NA
#>         rank valid_AphiaID                     valid_name valid_authority
#> 1    Species        254967           Platanista gangetica  (Lebeck, 1801)
#> 2 Subspecies        383571 Platanista gangetica gangetica  Roxburgh, 1801
#> 3 Subspecies        254969     Platanista gangetica minor      Owen, 1853
#>    kingdom   phylum    class           order        family      genus
#> 1 Animalia Chordata Mammalia Cetartiodactyla Platanistidae Platanista
#> 2 Animalia Chordata Mammalia Cetartiodactyla Platanistidae Platanista
#> 3 Animalia Chordata Mammalia Cetartiodactyla Platanistidae Platanista
#>                                                                                                                                                                                                                                     citation
#> 1 Perrin, W. (2015). Platanista gangetica (Lebeck, 1801). In: Perrin, W.F. (2015) World Cetacea Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=254967 on 2016-12-23
#> 2      Perrin, W. (2015). Platanista gangetica gangetica. In: Perrin, W.F. (2015) World Cetacea Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=383571 on 2016-12-23
#> 3              Perrin, W. (2015). Platanista gangetica minor. In: Perrin, W.F. (2015) World Cetacea Database. Accessed through:  World Register of Marine Species at http://marinespecies.org/aphia.php?p=taxdetails&id=254969 on 2016-12-23
#>                                        lsid isMarine isBrackish
#> 1 urn:lsid:marinespecies.org:taxname:254967       NA         NA
#> 2 urn:lsid:marinespecies.org:taxname:383571       NA         NA
#> 3 urn:lsid:marinespecies.org:taxname:254969        0         NA
#>   isFreshwater isTerrestrial isExtinct match_type             modified
#> 1            1            NA        NA       like 2010-01-04T17:38:16Z
#> 2            1            NA        NA       like 2009-03-04T11:50:55Z
#> 3            1             0        NA       like 2009-01-07T17:13:46Z
```

by many names


```r
wm_records_names(name = c('Platanista gangetica', 'Coryphaena'))
#> [[1]]
#>   AphiaID                                                           url
#> 1  254967 http://www.marinespecies.org/aphia.php?p=taxdetails&id=254967
#>         scientificname      authority   status unacceptreason    rank
#> 1 Platanista gangetica (Lebeck, 1801) accepted             NA Species
#>   valid_AphiaID           valid_name valid_authority  kingdom   phylum
#> 1        254967 Platanista gangetica  (Lebeck, 1801) Animalia Chordata
#>      class           order        family      genus
#> 1 Mammalia Cetartiodactyla Platanistidae Platanista
#>                                                                                                                                                                                                                                     citation
#> 1 Perrin, W. (2015). Platanista gangetica (Lebeck, 1801). In: Perrin, W.F. (2015) World Cetacea Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=254967 on 2016-12-23
#>                                        lsid isMarine isBrackish
#> 1 urn:lsid:marinespecies.org:taxname:254967       NA         NA
#>   isFreshwater isTerrestrial isExtinct match_type             modified
#> 1            1            NA        NA      exact 2010-01-04T17:38:16Z
#> 
#> [[2]]
#>   AphiaID                                                           url
#> 1  125960 http://www.marinespecies.org/aphia.php?p=taxdetails&id=125960
#> 2  843430                                                          <NA>
#>   scientificname      authority      status unacceptreason  rank
#> 1     Coryphaena Linnaeus, 1758    accepted           <NA> Genus
#> 2           <NA>           <NA> quarantined        synonym  <NA>
#>   valid_AphiaID     valid_name  valid_authority  kingdom   phylum
#> 1        125960     Coryphaena   Linnaeus, 1758 Animalia Chordata
#> 2        203867 Branchiostegus Rafinesque, 1815     <NA>     <NA>
#>         class       order        family      genus
#> 1 Actinopteri Perciformes Coryphaenidae Coryphaena
#> 2        <NA>        <NA>          <NA>       <NA>
#>                                                                                                                                                                                                                                   citation
#> 1 Bailly, N. (2014). Coryphaena Linnaeus, 1758. In: Froese, R. and D. Pauly. Editors. (2016). FishBase. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=125960 on 2016-12-23
#> 2                                                                                                                                                                                                                                     <NA>
#>                                        lsid isMarine isBrackish
#> 1 urn:lsid:marinespecies.org:taxname:125960        1          0
#> 2 urn:lsid:marinespecies.org:taxname:843430       NA         NA
#>   isFreshwater isTerrestrial isExtinct match_type             modified
#> 1            0            NA        NA      exact 2014-11-21T14:09:38Z
#> 2           NA            NA        NA      exact 2015-04-14T08:05:12Z
```

by common name


```r
wm_records_common(name = 'clam')
#>   AphiaID                                                           url
#> 1  141919 http://www.marinespecies.org/aphia.php?p=taxdetails&id=141919
#> 2  141936 http://www.marinespecies.org/aphia.php?p=taxdetails&id=141936
#>          scientificname        authority   status unacceptreason    rank
#> 1 Mercenaria mercenaria (Linnaeus, 1758) accepted             NA Species
#> 2       Venus verrucosa   Linnaeus, 1758 accepted             NA Species
#>   valid_AphiaID            valid_name  valid_authority  kingdom   phylum
#> 1        141919 Mercenaria mercenaria (Linnaeus, 1758) Animalia Mollusca
#> 2        141936       Venus verrucosa   Linnaeus, 1758 Animalia Mollusca
#>      class    order    family      genus
#> 1 Bivalvia Venerida Veneridae Mercenaria
#> 2 Bivalvia Venerida Veneridae      Venus
#>                                                                                                                                                                                                                 citation
#> 1 Gofas, S. (2004). Mercenaria mercenaria (Linnaeus, 1758). In:  MolluscaBase (2016). Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=141919 on 2016-12-23
#> 2         Gofas, S. (2004). Venus verrucosa Linnaeus, 1758. In:  MolluscaBase (2016). Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=141936 on 2016-12-23
#>                                        lsid isMarine isBrackish
#> 1 urn:lsid:marinespecies.org:taxname:141919        1         NA
#> 2 urn:lsid:marinespecies.org:taxname:141936        1         NA
#>   isFreshwater isTerrestrial isExtinct match_type             modified
#> 1           NA            NA        NA      exact 2004-12-21T16:54:05Z
#> 2           NA            NA        NA      exact 2004-12-21T16:54:05Z
```

using the TAXMATCH algorithm


```r
wm_records_taxmatch(name = 'Platanista gangetica')
#> [[1]]
#>   AphiaID                                                           url
#> 1  254967 http://www.marinespecies.org/aphia.php?p=taxdetails&id=254967
#>         scientificname      authority   status unacceptreason    rank
#> 1 Platanista gangetica (Lebeck, 1801) accepted             NA Species
#>   valid_AphiaID           valid_name valid_authority  kingdom   phylum
#> 1        254967 Platanista gangetica  (Lebeck, 1801) Animalia Chordata
#>      class           order        family      genus
#> 1 Mammalia Cetartiodactyla Platanistidae Platanista
#>                                                                                                                                                                                                                                     citation
#> 1 Perrin, W. (2015). Platanista gangetica (Lebeck, 1801). In: Perrin, W.F. (2015) World Cetacea Database. Accessed through:  World Register of Marine Species at http://www.marinespecies.org/aphia.php?p=taxdetails&id=254967 on 2016-12-23
#>                                        lsid isMarine isBrackish
#> 1 urn:lsid:marinespecies.org:taxname:254967       NA         NA
#>   isFreshwater isTerrestrial isExtinct match_type             modified
#> 1            1            NA        NA      exact 2010-01-04T17:38:16Z
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/worrms/issues).
* License: MIT
* Get citation information for `worrms` in R doing `citation(package = 'worrms')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md).
By participating in this project you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
