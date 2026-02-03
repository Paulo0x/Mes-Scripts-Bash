#!/bin/bash
JOURS=$1

if [ -z "$JOURS" ]; then
    echo "Usage: $0 <nombre_de_jours>"
    exit 1
fi

echo "Recherche des logs de plus de $JOURS jours dans /var/log..."

# On liste les fichiers .log et .gz anciens
LISTE=$(find /var/log -type f \( -name "*.log" -o -name "*.gz" \) -mtime +$JOURS)

if [ -z "$LISTE" ]; then
    echo "Aucun vieux fichier trouvé."
    exit 0
fi

echo "Fichiers à supprimer :"
echo "$LISTE"
du -sh $LISTE # Affiche la taille totale

read -p "Confirmer la suppression ? (y/n) : " CONFIRM
if [ "$CONFIRM" == "y" ]; then
    # On calcule la place libérée avant de supprimer
    PLACE=$(du -sh $LISTE | tail -1 | awk '{print $1}')
    rm $LISTE
    echo "Terminé. $PLACE ont été libérés."
    echo "$(date) : Suppression des logs de +$JOURS jours" >> nettoyeur.log
fi
