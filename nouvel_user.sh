#!/bin/bash

# On récupère le nom et le mot de passe
NOM=$1
MDP=$2

# 1. Vérifier si l'utilisateur a donné les 2 arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <nom_utilisateur> <mot_de_passe>"
    exit 1
fi

# 2. Vérifier si l'utilisateur existe déjà sur la Debian
if id "$NOM" &>/dev/null; then
    echo "Erreur : L'utilisateur $NOM existe déjà !"
    exit 1
else
    # 3. Création de l'utilisateur avec son dossier personnel (-m)
    useradd -m -s /bin/bash "$NOM"
    
    # 4. Attribution du mot de passe
    echo "$NOM:$MDP" | chpasswd
    
    echo "L'utilisateur $NOM a été créé avec succès."
fi
