#!/bin/bash
LISTE=$1
REUSSITE=0
ERREUR=0

if [ ! -f "$LISTE" ]; then echo "Fichier introuvable !"; exit 1; fi

while read PKG; do
    if dpkg -l | grep -q "^ii  $PKG "; then
        echo "[INFO] $PKG est déjà installé."
    else
        echo "[INSTALL] Installation de $PKG..."
        sudo apt-get install -y $PKG > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "[SUCCÈS] $PKG installé."
            ((REUSSITE++))
        else
            echo "[ERREUR] Échec pour $PKG."
            ((ERREUR++))
        fi
    fi
done < "$LISTE"

echo "Bilan : $REUSSITE installés, $ERREUR erreurs."
