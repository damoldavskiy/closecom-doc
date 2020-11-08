OUTDIR = build

.ONESHELL:
all:
	rm -f $(OUTDIR)*
	mkdir -p $(OUTDIR)
	cp -r server $(OUTDIR)
	cp -r client $(OUTDIR)
	cp -r common $(OUTDIR)
	cp -r styles $(OUTDIR)
	cd $(OUTDIR)
	cp styles/* server
	cp styles/* client
	cp styles/* common
	cd server
	latexmk -outdir=../build-server -pdf *.tex
	cd ../client
	latexmk -outdir=../build-client -pdf *.tex
	cd ../common
	latexmk -outdir=../build-common -pdf *.tex
	cd ..
	rm server/*
	rm client/*
	rm common/*
	mv build-server/*.pdf server
	mv build-client/*.pdf client
	mv build-common/*.pdf common
	rm -r build-*
	rm -r styles
