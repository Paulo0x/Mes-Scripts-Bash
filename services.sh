#!/bin/bash

# Liste des services à vérifier
SERVICES=("ssh" "cron" "apache2")

echo "--- ÉTAT DES SERVICES ---"

for SERV in "${SERVICES[@]}"; do
    # Vérifie si le service est actif
    ETAT=$(systemctl is-active $SERV)
    # Vérifie si le service est activé au démarrage
    AUTO=$(systemctl is-enabled $SERV)
    
    echo "Service: $SERV | État: $ETAT | Démarrage auto: $AUTO"
done

echo "-------------------------"
echo "1) Démarrer un service"
echo "2) Arrêter un service"
echo "q) Quitter"
read -p "Ton choix : " ACTION

if [ "$ACTION" == "1" ] || [ "$ACTION" == "2" ]; then
    read -p "Nom du service (ex: apache2) : " SNAME
    if [ "$ACTION" == "1" ]; then
        sudo systemctl start $SNAME
        echo "Tentative de démarrage de $SNAME..."
    else
        sudo systemctl stop $SNAME
        echo "Arrêt de $SNAME..."
    fi
    # Confirmation après action
    echo "Nouvel état : $(systemctl is-active $SNAME)"
fi
