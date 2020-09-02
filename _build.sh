#!/bin/sh

set -ev

Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
Rscript -e "epubFile <- bookdown::render_book('index.Rmd', 'bookdown::epub_book')"
Rscript -e "bookdown::calibre(epubFile, 'mobi')"
