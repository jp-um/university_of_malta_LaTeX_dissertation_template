#!/bin/bash

# that .git exclusion is super important ...
find . -regex ".*[^\.git].*\(aux\|bbl\|blg\|idx\|log\|lof\|lot\|nav\|out\|snm\|toc\|synctex.gz\)$" -not -path '*/.git/*' -exec rm -vf {} \;
