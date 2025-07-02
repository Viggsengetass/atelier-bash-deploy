#!/bin/bash

# Charger les variables d’environnement
source .env

# 🔒 Vérifier la branche
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$BRANCH" != "main" ]; then
  echo "❌ Déploiement interdit : vous êtes sur la branche '$BRANCH'"
  exit 1
fi

# 📦 Commandes
case "$1" in
  deploy)
    echo "🚀 Déploiement en cours..."

    mkdir -p "$DEPLOY_DIR"
    mkdir -p "$BACKUP_DIR"

    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    BACKUP_PATH="$BACKUP_DIR/deploy_$TIMESTAMP"
    cp -r "$DEPLOY_DIR" "$BACKUP_PATH"
    echo "✅ Backup créé dans $BACKUP_PATH"

    if [ -d "$SRC_DIR" ]; then
      cp -r "$SRC_DIR/"* "$DEPLOY_DIR"
      echo "✅ Fichiers copiés dans $DEPLOY_DIR"
      echo "Déploiement effectué le $(date)" >> "$LOG_FILE"

      # 🔔 Notification + ouverture navigateur selon OS
      OS=$(uname)
      case "$OS" in
        Darwin*)
          osascript -e 'display notification "Le déploiement est terminé." with title "Déploiement"'
          open "$DEPLOY_DIR/index.html"
          ;;
        Linux*)
          notify-send "Déploiement terminé" "Le déploiement s'est bien déroulé."
          xdg-open "$DEPLOY_DIR/index.html"
          ;;
        MINGW*|MSYS*|CYGWIN*)
          start "" "$DEPLOY_DIR/index.html"
          ;;
        *)
          echo "ℹ️ Système non reconnu : pas d'ouverture automatique"
          ;;
      esac

      # 🧪 Lancer les tests
      echo "🧪 Lancement des tests post-déploiement..."
      ./test_deploy.sh
    else
      echo "❌ Erreur : dossier $SRC_DIR introuvable"
      exit 1
    fi
    ;;

  status)
    echo "📄 Derniers logs de déploiement :"
    tail -n 5 "$LOG_FILE"
    ;;

  rollback)
    echo "↩️ Restauration de la version précédente..."
    LAST_BACKUP=$(ls -td "$BACKUP_DIR"/deploy_* | head -1)
    if [ -d "$LAST_BACKUP" ]; then
      cp -r "$LAST_BACKUP/"* "$DEPLOY_DIR"
      echo "✅ Rollback effectué depuis $LAST_BACKUP"
    else
      echo "❌ Aucun backup trouvé"
    fi
    ;;

  *)
    echo "Usage : $0 {deploy|status|rollback}"
    exit 1
    ;;
esac
