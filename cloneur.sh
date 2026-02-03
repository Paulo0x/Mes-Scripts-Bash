#!/bin/bash

# On vérifie si l'utilisateur a bien donné 2 arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source> <cible>"
    exit 1
fi

SOURCE=$1
CIBLE=$2

# Vérification et création du dossier cible
if [ ! -d "$CIBLE" ]; then
    mkdir -p "$CIBLE"
fi

# Copie des fichiers
cp -r "$SOURCE/." "$CIBLE"
