#!/bin/bash
wname=$(basename $(pwd))

pandoc $wname.md --template $TOOLS_PATH/eisvogel.tex --pdf-engine=xelatex -o $wname.tex -colorlinks -V lang=fr-FR --listings
sed -i -E 's/\\lstinline\[language=bash\].(.*?).\}/\\shellcmd{\1}}/' $wname.tex

xelatex $wname.tex 1> /dev/null
