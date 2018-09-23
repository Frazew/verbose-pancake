#!/bin/bash

function setup_template() {
	cp $TOOLS_PATH/template.md.defaults $TOOLS_PATH/template.md
	sed -i.bak "s#<titrewriteup>#$1#" $TOOLS_PATH/template.md
	sed -i.bak "s#<pseudo>#$2#" $TOOLS_PATH/template.md
}
echo "Installation automagique d'un environnement pandoc swaggué"
echo "pour les writups de CTF HackademINT"
echo
if lsb_release -c | grep "sstretch" > /dev/null; then
	echo "Debian stretch detecté, parfait"
	echo
else
	read -p "Ce script a été testé sous debian stretch, voulez-vous vraiment continuer ? (y/N)" -r
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		exit 1
	fi
fi

echo "Le script va installer une (très grande) certaine quantité de packets"
echo "Vérifiez que vous avez la place avant, LaTeX est lourd"
read -p "C'est parti ? (Y/n)" -r

if [[ $REPLY =~ ^[Nn]$ ]]
then
	exit 1
fi

sudo apt-get install pandoc texlive texlive-fonts-extra texlive-latex-extra texlive-xetex texlive-math-extra texlive-luatex

echo "Si tout s'est bien passé, l'environnement de base est prêt"
echo "On peut maintenant sourcer source.sh"
. source.sh
echo "Et configurer le template"
read -e -p "Nom du writeup [Example writeup]: " WTUPNAME
WTUPNAME=${WTUPNAME:-"Example writeup"}
read -e -p "Pseudo [Patrick]: " PSEUDO
PSEUDO=${PSEUDO:-Patrick}
setup_template $WTUPNAME $PSEUDO

echo
echo "Installation terminée, il y a deux commandes à retenir :"
echo "mkwriteup qui setup un nouveau writeup de chall"
echo "genpdf qui génère le pdf à partir du Markdown"
