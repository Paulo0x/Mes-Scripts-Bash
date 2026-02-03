#!/bin/bash
SECRET=$(( ( RANDOM % 100 )  + 1 ))
CHOIX=0

echo "Devine le nombre entre 1 et 100 !"

while [ $CHOIX -ne $SECRET ]; do
    read -p "Ton choix : " CHOIX
    if [ $CHOIX -lt $SECRET ]; then
        echo "C'est plus haut !"
    elif [ $CHOIX -gt $SECRET ]; then
        echo "C'est plus bas !"
    fi
done

echo "Bravo ! Le nombre était bien $SECRET."
