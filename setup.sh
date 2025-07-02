#!/bin/bash

# Vérifie si le fichier existe
if [ ! -f "./post-merge" ]; then
  echo "❌ Erreur : fichier ./post-merge introuvable"
  exit 1
fi

# Installation du hook Git post-merge
echo "🔧 Installation du hook Git post-merge..."
cp ./post-merge .git/hooks/post-merge
chmod +x .git/hooks/post-merge
echo "✅ Hook post-merge installé avec succès"
