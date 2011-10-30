#!/bin/bash
cat workshop-list.html | sed 's/<\/tr>/<\/tr>\n/g' | sed 's/<\/td>/:/g' | sed 's/<[^>]*>//g' | sed 's/&nbsp;/ /g' | less > parts/list.csv
