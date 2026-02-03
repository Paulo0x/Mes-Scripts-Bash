#!/bin/bash

# Définition des couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # Pas de couleur

echo "--- ANALYSE DU DISQUE ---"

# On lit les partitions ligne par ligne (sauf l'en-tête)
df -h | grep '^/' | while read line; do
    USAGE=$(echo $line | awk '{print $5}' | sed 's/%//')
    
    if [ $USAGE -gt 80 ]; then
        echo -e "${RED}ALERTE : $line${NC}"
    else
        echo -e "${GREEN}OK : $line${NC}"
    fi
done

echo ""
echo "Les 10 plus gros dossiers dans /home :"
du -sh /home/* 2>/dev/null | sort -rh | head -n 10
