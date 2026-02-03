#!/bin/bash

# Liste des serveurs à tester
SERVEURS=("google.com" "github.com" "8.8.8.8" "cloudflare.com" "monsiteweb.fr")
ACCESSIBLES=0
TOTAL=${#SERVEURS[@]}
RAPPORT="rapport_reseau.txt"

echo "Vérification de la connexion... (Veuillez patienter)"
echo "Rapport du $(date)" > $RAPPORT

for SITE in "${SERVEURS[@]}"; do
    # On fait 2 pings rapides (-c 2)
    if ping -c 2 -W 2 $SITE > /dev/null; then
        echo "[✅] $SITE est accessible"
        echo "$SITE : OK" >> $RAPPORT
        ((ACCESSIBLES++))
    else
        echo "[❌] $SITE est INACCESSIBLE"
        echo "$SITE : ERREUR" >> $RAPPORT
    fi
done

echo "-----------------------------------"
echo "Résumé : $ACCESSIBLES/$TOTAL serveurs en ligne."
echo "Rapport enregistré dans $RAPPORT"

