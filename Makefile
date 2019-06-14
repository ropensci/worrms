RSCRIPT = Rscript --no-init-file

all: document install

move:
	cp inst/vign/worrms.md vignettes

rmd2md:
	cd vignettes;\
	mv worrms.md worrms.Rmd

check:
	${RSCRIPT} -e 'devtools::check(document = FALSE, cran = TRUE)'

document:
	${RSCRIPT} -e 'devtools::document()'

install:
	${RSCRIPT} -e 'devtools::install()'

installvign:
	${RSCRIPT} -e 'devtools::install(build_vignettes=TRUE)'

readme: README.Rmd
	${RSCRIPT} -e "knitr::knit('$<')"

checkwin:
	${RSCRIPT} -e "devtools::check_win_devel(quiet = TRUE); devtools::check_win_release(quiet = TRUE)"

# No real targets!
.PHONY: all check document install
