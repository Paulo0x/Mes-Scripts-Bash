#!/bin/bash
LISTE=$1

# Vérification si le fichier est bien là
if [ ! -f "$LISTE" ]; then
    echo "Erreur : Fichier $LISTE introuvable."
    exit 1
fi

while read NOM; do
    # On vérifie si l'utilisateur existe déjà (comme dans l'exo 4)
    if id "$NOM" &>/dev/null; then
        echo "Saut de $NOM : déjà présent sur le système."
    else
        echo "Création de $NOM..."
        useradd -m -s /bin/bash "$NOM"
        # Mot de passe par défaut pour tout le groupe
        echo "$NOM:Bienvenue2026" | chpasswd
    fi
done < "$LISTE"
