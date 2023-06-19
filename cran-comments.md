## Test environments

* local windows 10 installation, R 4.2.0
* win-builder (devel and release)
* ubuntu 22.04.2 LTS (on github actions), R 4.3.0
* macOS 12.6.5 (on github actions), R 4.3.0


## R CMD check results

0 errors | 0 warnings | 1 note

This note appeared in the win-builder and it is related to the change of maintainer:

```
* checking CRAN incoming feasibility ... [11s] NOTE
Maintainer: 'Bart Vanhoorne. <salvador.fernandez@vliz.be>'

New maintainer:
  Bart Vanhoorne. <salvador.fernandez@vliz.be>
Old maintainer(s):
  Scott Chamberlain <myrmecocystus@gmail.com>
```

Both persons agreed on the exchange of the maintainer role, see https://github.com/ropensci/worrms/issues/34

## revdepcheck results

We checked 2 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages

---

This version fixes some functions and changes the maintainer

Thanks!
Salvador Fernández
