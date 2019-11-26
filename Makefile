RSCRIPT = Rscript --no-init-file

all: document install

move:
	cp inst/vign/worrms.md vignettes

rmd2md:
	cd vignettes;\
	mv worrms.md worrms.Rmd

check:
	${RSCRIPT} -e 'rcmdcheck::rcmdcheck(args = c("--as-cran"))'

doc:
	${RSCRIPT} -e 'devtools::document()'

build:
	R CMD BUILD .

install: doc build
	R CMD INSTALL . && rm *.tar.gz

installvign:
	${RSCRIPT} -e 'devtools::install(build_vignettes=TRUE)'

readme: README.Rmd
	${RSCRIPT} -e "knitr::knit('$<')"

checkwin:
	${RSCRIPT} -e "devtools::check_win_devel(quiet = TRUE); devtools::check_win_release(quiet = TRUE)"

test:
	${RSCRIPT} -e "devtools::test()"

# No real targets!
.PHONY: all check document install
