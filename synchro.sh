#!/bin/bash
SRC=$1
DST=$2

if [ $# -ne 2 ]; then echo "Usage: $0 <source> <destination>"; exit 1; fi

# On utilise rsync, l'outil pro par excellence pour la synchro
# -a : archive (garde les droits), -v : verbeux, --delete : supprime dans DST si supprimé dans SRC
rsync -av --delete "$SRC/" "$DST/"

echo "Synchronisation terminée avec succès."
