worrms 0.2.0
============

### NEW FEATURES

* Added additional sister functions to most exported functions in the 
package, all with trailing underscore. For example, `wm_children` and 
`wm_children_`. These underscore methods take in many inputs, typically
of a AphiaID or a taxonomic or vernacular name. We decided to make 
separate functions so that we minimize any disturbance to the existing 
package API. (#4) (#6)

## MINOR IMPROVEMENTS

* Moved to using markdown docs (#5)
* All functions now state what they return (#9)


worrms 0.1.0
============

### NEW FEATURES

* Released to CRAN.
