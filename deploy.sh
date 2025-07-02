#!/bin/bash

# Chargement des variables depuis le fichier .env
source .env

# 🔒 Vérification que la branche active est 'main'
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$BRANCH" != "main" ]; then
  echo "❌ Déploiement interdit : vous êtes sur la branche '$BRANCH'"
  exit 1
fi

# 🧭 Menu CLI
case "$1" in
  deploy)
    echo "🚀 Déploiement en cours..."
    mkdir -p "$DEPLOY_DIR"
    mkdir -p "$BACKUP_DIR"

    if [ -d "$SRC_DIR" ]; then
      # Sauvegarde de l’ancien déploiement
      TIMESTAMP=$(date +%Y%m%d_%H%M%S)
      BACKUP_PATH="$BACKUP_DIR/deploy_$TIMESTAMP"
      cp -r "$DEPLOY_DIR" "$BACKUP_PATH"
      echo "🗂️  Backup créé dans $BACKUP_PATH"

      # Déploiement
      cp -r "$SRC_DIR"/* "$DEPLOY_DIR"
      echo "✅ Fichiers copiés dans $DEPLOY_DIR"
      echo "Déploiement effectué le $(date)" >> "$LOG_FILE"

      # Notification (Windows)
      start "" "$DEPLOY_DIR/index.html"

      # Linux (décommenter si besoin)
      # notify-send "Déploiement terminé" "Le déploiement s'est bien déroulé."
      # xdg-open "$DEPLOY_DIR/index.html"

    else
      echo "❌ Erreur : dossier $SRC_DIR introuvable"
      exit 1
    fi
    ;;

  rollback)
    echo "♻️  Restauration de la version précédente..."
    LAST_BACKUP=$(ls -td $BACKUP_DIR/* | head -1)
    if [ -d "$LAST_BACKUP" ]; then
      cp -r "$LAST_BACKUP"/* "$DEPLOY_DIR"
      echo "✅ Rollback effectué depuis $LAST_BACKUP"
    else
      echo "❌ Aucun backup trouvé"
    fi
    ;;

  status)
    echo "📄 Derniers logs de déploiement :"
    tail -n 5 "$LOG_FILE"
    ;;

  *)
    echo "Usage: $0 {deploy|status|rollback}"
    exit 1
    ;;
esac
