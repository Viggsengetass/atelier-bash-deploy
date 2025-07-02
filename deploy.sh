#!/bin/bash

DEPLOY_DIR="./deploy_prod"

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

    if [ -d src ]; then
      cp -r src/* "$DEPLOY_DIR"
      echo "✅ Fichiers copiés dans $DEPLOY_DIR"
      echo "Déploiement effectué le $(date)" >> deploy_log.txt
    else
      echo "❌ Erreur : dossier src introuvable"
      exit 1
    fi
    ;;

  status)
    echo "📄 Derniers logs de déploiement :"
    tail -n 5 deploy_log.txt
    ;;

  *)
    echo "Usage: $0 {deploy|status}"
    exit 1
    ;;
esac
