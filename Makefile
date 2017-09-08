default: book.pdf
.PHONY: default

pages.tex: pages.txt buildpages.awk
	awk -f buildpages.awk $< | tail -n+5 > $@

book.pdf: book.tex pages.tex intro.tex
	xelatex -jobname=book $^

clean:
	@rm -f *.log *.aux book.pdf pages.tex
.PHONY: clean
