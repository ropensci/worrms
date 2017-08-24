all: move rmd2md

move:
		cp inst/vign/worrms_vignette.md vignettes

rmd2md:
		cd vignettes;\
		mv worrms_vignette.md worrms_vignette.Rmd
