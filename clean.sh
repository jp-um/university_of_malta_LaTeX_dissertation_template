#!/bin/bash

# that .git exclusion is super important ...
find . -regex ".*[^\.git].*\(aux\|bbl\|bcf\|blg\|idx\|ilg\|ind\|log\|lof\|lot\|nav\|out\|run.xml\|snm\|toc\|synctex.gz\|fls\|fdb_latexmk\)$" -not -path '*/.git/*' -exec rm -vf {} \;
