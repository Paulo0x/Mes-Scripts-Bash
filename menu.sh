#!/bin/bash

# Définition des couleurs pour le style
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

while true; do
    clear
    echo -e "${BLUE}========================================================${NC}"
    echo -e "${BLUE}          SUPER-GESTIONNAIRE DEBBIAN (12-en-1)          ${NC}"
    echo -e "${BLUE}========================================================${NC}"
    echo -e "${YELLOW}--- BASIQUES ---${NC}"
    echo "1)  Cloner un dossier (Exo 1)"
    echo "2)  Sauvegarde compressée .tar.gz (Exo 2)"
    echo "3)  Jeu du Plus ou Moins (Exo 3)"
    echo -e "${YELLOW}--- UTILISATEURS ---${NC}"
    echo "4)  Créer un utilisateur (Exo 4)"
    echo "5)  Création en masse via CSV (Bonus Exo 4)"
    echo -e "${YELLOW}--- MAINTENANCE & LOGS ---${NC}"
    echo "6)  Gérer les services (SSH, Apache...) (Exo 6)"
    echo "7)  Nettoyeur de vieux logs (Exo 7)"
    echo "10) Installateur de paquets automatique (Exo 10)"
    echo -e "${YELLOW}--- MONITORING & RESEAU ---${NC}"
    echo "8)  Analyseur d'espace disque (Exo 8)"
    echo "9)  Vérificateur de connexion réseau (Exo 9)"
    echo "11) Générer un rapport système HTML (Exo 11)"
    echo "12) Synchroniser deux dossiers (Exo 12)"
    echo -e "${RED}q)  Quitter${NC}"
    echo -e "${BLUE}========================================================${NC}"
    read -p "Fais ton choix : " CHOIX

    case $CHOIX in
        1) read -p "Source : " S; read -p "Cible : " C; ./cloneur.sh "$S" "$C" ;;
        2) read -p "Dossier à sauvegarder : " D; ./sauvegarde.sh "$D" ;;
        3) ./jeu.sh ;;
        4) read -p "Nom : " N; read -p "Pass : " P; sudo ./nouvel_user.sh "$N" "$P" ;;
        5) read -p "Fichier CSV : " F; sudo ./bonus_users.sh "$F" ;;
        6) ./services.sh ;;
        7) read -p "Nb de jours max : " J; ./nettoyeur.sh "$J" ;;
        8) ./disque.sh ;;
        9) ./reseau.sh ;;
        10) read -p "Fichier de liste (txt) : " L; ./installateur.sh "$L" ;;
        11) ./rapport.sh ;;
        12) read -p "Source : " S; read -p "Destination : " D; ./synchro.sh "$S" "$D" ;;
        q) echo "Bye !"; exit 0 ;;
        *) echo -e "${RED}Option invalide !${NC}" ;;
    esac

    echo -e "\n${GREEN}Appuie sur Entrée pour revenir au menu...${NC}"
    read
done
