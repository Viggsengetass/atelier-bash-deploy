#!/bin/bash

# Script d'installation du hook Git post-merge
HOOK_FILE=".git/hooks/post-merge"

echo "🔧 Installation du hook Git post-merge..."
cp post-merge "$HOOK_FILE"
chmod +x "$HOOK_FILE"
echo "✅ Hook post-merge installé avec succès"
