#!/bin/bash

DEPLOY_DIR="./deploy_prod"  # Dossier local simulant un serveur

echo "🚀 Déploiement local en cours..."

mkdir -p "$DEPLOY_DIR"

if [ -f index.html ]; then
  cp index.html "$DEPLOY_DIR"
  echo "✅ Fichier copié dans $DEPLOY_DIR"
else
  echo "❌ Erreur : index.html introuvable"
  exit 1
fi
