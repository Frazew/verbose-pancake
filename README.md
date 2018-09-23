# verbose-pancake
Un nom aussi beau implique une excellente description...

## Description

verbose-pancake (oui oui) est un petit outil visant à faciliter la rédaction de writeups de CTFs pour [HackademINT](http://hackademint.minet.net/).
Il installe automatiquement pandoc et les packages nécessaires au bon fonctionnement du template latex utilisé.
L'idée est de cloner ce repo à chaque fois que vous voulez créer des writeups pour un nouveau CTF !

## Utilisation

### Premier lancement

Il suffit de lancer `./install.sh`
Le script a été testé sous Debian stretch, il est donc très probable qu'il fonctionne moins bien sous d'autre distributions.
Si c'est le cas, installez manuellement les packages LaTeX manquants ;)

### Utilisation

Toute rédaction commencer par sourcer `. source.sh`. Le script configure quelques variables d'environnement et alias pour rédiger tranquillement.

Les commandes utiles sont les suivantes :

- `mkwriteup <nom_fichier> <nom_chall>` dont les arguments sont le nom souhaité pour le fichier et le nom (joli) du chall
- `genpdf` sans argument, qui génère le pdf du fichier Markdown dans le dossier courant

## Scenario standard

1. Vous clonez le dépot `git clone https://github.com/Frazew/verbose-pancake.git`.
2. Vous exécutez `./install.sh` et indiquez le nom du CTF et votre pseudo.
3. Vous exécutez `mkwriteup example_writeup1 "Example de writeup 1"`.
4. Vous modifiez example_writeup1.md comme vous voulez
5. Vous générez le pdf avec `genpdf`
6. ???
7. Enjoy!
