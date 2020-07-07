PACKAGE := $(shell grep '^Package:' DESCRIPTION | sed -E 's/^Package:[[:space:]]+//')
RSCRIPT = Rscript --no-init-file

vign:
	cd vignettes;\
	${RSCRIPT} -e "Sys.setenv(NOT_CRAN='true'); knitr::knit('worrms.Rmd.og', output = 'worrms.Rmd')";\
	cd ..

check: build
	_R_CHECK_CRAN_INCOMING_=FALSE R CMD CHECK --as-cran --no-manual `ls -1tr ${PACKAGE}*gz | tail -n1`
	@rm -f `ls -1tr ${PACKAGE}*gz | tail -n1`
	@rm -rf ${PACKAGE}.Rcheck

doc:
	${RSCRIPT} -e 'devtools::document()'

eg:
	${RSCRIPT} -e 'devtools::run_examples(run=TRUE)'

build:
	R CMD BUILD .

install: doc build
	R CMD INSTALL . && rm *.tar.gz

installvign:
	${RSCRIPT} -e 'devtools::install(build_vignettes=TRUE)'

readme:
	${RSCRIPT} -e "knitr::knit('README.Rmd')"

checkwindows:
	${RSCRIPT} -e "devtools::check_win_devel(quiet = TRUE); devtools::check_win_release(quiet = TRUE)"

test:
	${RSCRIPT} -e "devtools::test()"

# No real targets!
.PHONY: all check document install
