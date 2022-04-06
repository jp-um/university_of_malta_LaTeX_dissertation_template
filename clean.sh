#!/bin/bash

find . -regex ".*\(aux\|bbl\|blg\|idx\|log\|lof\|lot\|nav\|out\|snm\|toc\|synctex.gz\)$" -exec rm -f {} \;
