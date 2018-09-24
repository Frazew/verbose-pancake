#!/bin/bash
wname=$(basename $(pwd))

TEX_ARG="--latex-engine"
if pandoc -v | grep "2\.." >/dev/null; then TEX_ARG="--pdf-engine"; fi
pandoc $wname.md --template $TOOLS_PATH/eisvogel.tex $TEX_ARG=xelatex -o $wname.tex -colorlinks -V lang=fr-FR --listings
sed -i -E 's/\\passthrough\{\\lstinline\[language=bash\].(.*?).\}/{\\shellcmd{\1}}/' $wname.tex

xelatex $wname.tex 1> /dev/null
