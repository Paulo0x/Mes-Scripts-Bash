#!/bin/bash
DOSSIER=$1
DATE=$(date +%Y-%m-%d)
NOM_ARCHIVE="sauvegarde_$DATE.tar.gz"

echo "Compression de $DOSSIER en cours..."
tar -czf "$NOM_ARCHIVE" "$DOSSIER"
echo "Sauvegarde terminée : $NOM_ARCHIVE"
