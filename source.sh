#!/bin/bash
if [ "$0" = "$BASH_SOURCE" ]; then
	echo "Je suis fait pour être sourcé, pas exécuté :) . setup.sh"
	exit 1
fi

export TOOLS_PATH=$(pwd)/.tools/
alias genpdf="$(pwd)/.tools/genpdf.sh"

mkwriteup() {
	if [ $# -lt 2 ]; then echo "mkwriteup <nom_fichier> <nom_chall>"
	else
		mkdir $1
		mkdir $1/images
		cp $TOOLS_PATH/logo.png $1/images/logo.png
		sed "s#<nomduchall>#$2#" $TOOLS_PATH/template.md > $1/$1.md
		cd $1
	fi
}
