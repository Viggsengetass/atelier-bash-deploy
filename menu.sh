#!/bin/bash

while true; do
  clear
  echo "=== Atelier Bash Deploy ==="
  echo "1. Lancer un déploiement"
  echo "2. Lancer les tests post-déploiement"
  echo "3. Effectuer un rollback"
  echo "4. Quitter"
  read -p "Votre choix [1-4] : " choix

  case $choix in
    1)
      ./deploy.sh deploy
      read -p "Appuyez sur Entrée pour continuer..."
      ;;
    2)
      ./test_deploy.sh
      read -p "Appuyez sur Entrée pour continuer..."
      ;;
    3)
      ./rollback.sh
      read -p "Appuyez sur Entrée pour continuer..."
      ;;
    4)
      echo "Fermeture du menu."
      break
      ;;
    *)
      echo "Choix invalide."
      sleep 1
      ;;
  esac
done
