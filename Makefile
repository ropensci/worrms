PACKAGE := $(shell grep '^Package:' DESCRIPTION | sed -E 's/^Package:[[:space:]]+//')
RSCRIPT = Rscript --no-init-file

all: document install

move:
	cp inst/vign/worrms.md vignettes

rmd2md:
	cd vignettes;\
	mv worrms.md worrms.Rmd

check: build
	_R_CHECK_CRAN_INCOMING_=FALSE R CMD CHECK --as-cran --no-manual `ls -1tr ${PACKAGE}*gz | tail -n1`
	@rm -f `ls -1tr ${PACKAGE}*gz | tail -n1`
	@rm -rf ${PACKAGE}.Rcheck

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
