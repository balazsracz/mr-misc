

all: labels.pdf fulllist.pdf

GEN=resistors.tex other.tex


$(GEN): ../listproc.awk ../list.csv
	../listproc.awk < ../list.csv

rest.tex: ../rest.tex
	ln -sf ../rest.tex .

labels.pdf: $(GEN) rest.tex ../labels.tex
	pdflatex ../labels.tex && pdflatex ../labels.tex


fulllist.pdf: $(GEN) rest.tex ../fulllist.tex
	pdflatex ../fulllist.tex && pdflatex ../fulllist.tex

