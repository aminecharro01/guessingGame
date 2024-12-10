#!/bin/bash

# Fonction pour obtenir le nombre de fichiers dans le répertoire actuel
get_file_count() {
    echo $(ls -1 | wc -l)
}

# Début du jeu
echo "Bienvenue dans le jeu de devinettes!"
echo "Pouvez-vous deviner combien de fichiers se trouvent dans le répertoire actuel?"

# Récupérer le nombre correct de fichiers
correct_count=$(get_file_count)

while true; do
    # Demander à l'utilisateur d'entrer une estimation
    read -p "Entrez votre estimation : " guess

    # Vérifier si l'entrée est un nombre
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Veuillez entrer un nombre entier valide."
        continue
    fi

    # Comparer la réponse avec le nombre correct
    if [[ $guess -lt $correct_count ]]; then
        echo "Trop bas! Essayez encore."
    elif [[ $guess -gt $correct_count ]]; then
        echo "Trop haut! Essayez encore."
    else
        echo "Félicitations! Vous avez deviné correctement!"
        break
    fi
done
