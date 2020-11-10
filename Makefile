OUTDIR = build
TARGETS = client server common

.ONESHELL:
all:
	rm -r $(OUTDIR)
	mkdir -p $(OUTDIR)
	for target in $(TARGETS) ; do \
		cp -r $$target $(OUTDIR) ; \
		cp styles/* $(OUTDIR)/$$target ; \
	done
	cd $(OUTDIR)
	for target in $(TARGETS) ; do \
		cd $$target ; \
		latexmk -outdir=../build-$$target -pdf *.tex >/dev/null ; \
		cd .. ; \
		rm $$target/* ; \
		mv build-$$target/*.pdf $$target ; \
		rm -r build-$$target ; \
	done
