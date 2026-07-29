IMAGE := rendercv-builder
OUT   := output

.PHONY: all build render render-en render-fr watch clean

all: render

build:
	docker build -t $(IMAGE) .

RENDER_FLAGS := --dont-generate-markdown --dont-generate-html --dont-generate-png

render: build render-en render-fr

render-en: build
	docker run --rm -v $(CURDIR):/data $(IMAGE) render cv/en.yaml \
		--pdf-path ../$(OUT)/Jerome_Desseaux_CV_EN.pdf $(RENDER_FLAGS)

render-fr: build
	docker run --rm -v $(CURDIR):/data $(IMAGE) render cv/fr.yaml \
		--pdf-path ../$(OUT)/Jerome_Desseaux_CV_FR.pdf $(RENDER_FLAGS)

watch: build
	docker run --rm -v $(CURDIR):/data $(IMAGE) render cv/en.yaml --watch

clean:
	rm -rf $(OUT) cv/rendercv_output rendercv_output
