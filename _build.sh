#!/bin/sh

set -ev

Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
Rscript -e "Sys.setenv('epubFile' = bookdown::render_book('index.Rmd', 'bookdown::epub_book'))"
Rscript -e "bookdown::calibre(Sys.getenv('epubFile'), 'mobi')"
Rscript -e "Sys.unsetenv('epubFile')"
