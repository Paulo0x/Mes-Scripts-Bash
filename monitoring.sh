#!/bin/bash
# On définit le fichier à analyser
FICHIER="/var/log/syslog"

echo "--- ANALYSE DES 10 IP LES PLUS ACTIVES ---"

# La "magie" des commandes en chaîne :
grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" $FICHIER | sort | uniq -c | sort -nr | head -n 10
