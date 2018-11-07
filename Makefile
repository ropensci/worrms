RSCRIPT = Rscript --no-init-file

all: document install

move:
		cp inst/vign/worrms_vignette.md vignettes

rmd2md:
		cd vignettes;\
		mv worrms_vignette.md worrms_vignette.Rmd

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

# No real targets!
.PHONY: all check document install
