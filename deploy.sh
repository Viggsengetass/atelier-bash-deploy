#!/bin/bash

DEPLOY_DIR="./deploy_prod"  # Chemin relatif au projet

echo "🚀 Déploiement en cours..."

mkdir -p "$DEPLOY_DIR"

if [ -f index.html ]; then
  cp index.html "$DEPLOY_DIR"
  echo "✅ Fichier copié dans $DEPLOY_DIR"
else
  echo "❌ Erreur : index.html introuvable"
  exit 1
fi
