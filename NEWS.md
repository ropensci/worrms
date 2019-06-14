worrms 0.4.0
============

### NEW FEATURES

* new functions `wm_ranks_id()` and `wm_ranks_name()` for getting taxonomic ranks by rank identifier or rank name (#20)
* new function `wm_records_rank()` for getting AphiaRecords for a given rank id (#20)

### MINOR IMPROVEMENTS

* `wm_synonyms()` gains `offset` parameter to allow pagination (#20)
* `tibble::as_data_frame()` replaced with `tibble::as_tibble()`

### DEPRECATED AND DEFUNCT

* `wm_record_()` is deprecated; `wm_record()` now handles 1 or more AphiaID's

### BUG FIXES

* fix `wm_children` test that was failing on cran checks (#21)


worrms 0.3.2
============

### MINOR IMPROVEMENTS

* add link to taxize book in vignette and README (#12)

### BUG FIXES

* fix bug in test regarding date (#19)

worrms 0.3.0
============

### MINOR IMPROVEMENTS

* fix to most functions throughout the package (those that have two versions, with and without an underscore): underscore versions of functions now do not error when an input is not found, but instead warn the user and move on - to facilitate working with many inputs. the non-underscore version of each function still only accepts 1 input and errors if you give more than 1 (#14) (#18)

### BUG FIXES

* make sure that functions that accept only 1 input for the first parameter error well with an informative message (#15)


worrms 0.2.8
============

### NEW FEATURES

* Integration with `vcr` and `webmockr` packages for unit test stubbing
* gains new functions for getting WORMS traits data (they call them "attributes"): `wm_attr_aphia`, `wm_attr_aphia_`, `wm_attr_category`, `wm_attr_category_`, `wm_attr_data`, `wm_attr_data_`, `wm_attr_def`, `wm_attr_def_`  (#3)


worrms 0.2.0
============

### NEW FEATURES

* Added additional sister functions to most exported functions in the 
package, all with trailing underscore. For example, `wm_children` and 
`wm_children_`. These underscore methods take in many inputs, typically
of a AphiaID or a taxonomic or vernacular name. We decided to make 
separate functions so that we minimize any disturbance to the existing 
package API. (#4) (#6)

### MINOR IMPROVEMENTS

* Moved to using markdown docs (#5)
* All functions now state what they return (#9)


worrms 0.1.0
============

### NEW FEATURES

* Released to CRAN.
