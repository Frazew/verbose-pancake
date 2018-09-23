#!/bin/bash
wname=$(basename $(pwd))
pandoc $wname.md --template $TOOLS_PATH/eisvogel.tex --latex-engine=xelatex -o $wname.pdf --listings -colorlinks -V lang=fr-FR
