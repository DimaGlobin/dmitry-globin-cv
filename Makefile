IMAGE  := texlive/texlive:latest
VOLUME := -v "$(CURDIR)":/workdir
PDF    := main.pdf
SRC    := main.tex
ENGINE := xelatex

.PHONY: all clean

all: $(PDF)

$(PDF): $(SRC)
	docker run --rm $(VOLUME) -w /workdir $(IMAGE) \
	  bash -c "$(ENGINE) -interaction=nonstopmode $(SRC) && $(ENGINE) -interaction=nonstopmode $(SRC)"

clean:
	rm -f main.aux main.log main.out main.toc $(PDF)
