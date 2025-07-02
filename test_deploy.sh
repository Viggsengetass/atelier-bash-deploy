#!/bin/bash

source .env

echo "🔍 Lancement des tests de déploiement..."

# Test 1 : le dossier de déploiement existe
echo -n "📁 Test : dossier '$DEPLOY_DIR' existe... "
[ -d "$DEPLOY_DIR" ] && echo "✔ OK" || echo "❌ KO"

# Test 2 : le fichier index.html est copié
echo -n "📄 Test : '$DEPLOY_DIR/index.html' copié... "
[ -f "$DEPLOY_DIR/index.html" ] && echo "✔ OK" || echo "❌ KO"

# Test 3 : le fichier de log existe
echo -n "📝 Test : fichier de log '$LOG_FILE' existe... "
[ -f "$LOG_FILE" ] && echo "✔ OK" || echo "❌ KO"

# Test 4 : contenu du log
echo -n "📌 Test : dernière ligne du log contient la date d’aujourd’hui... "
last_log=$(tail -n 1 "$LOG_FILE")
today=$(date "+%b %e")
echo "$last_log" | grep -q "$today" && echo "✔ OK" || echo "❌ KO"

# Test 5 : dossier de backup le plus récent existe (optionnel)
last_backup=$(ls -td deploy_backups/*/ 2>/dev/null | head -n1)
echo -n "♻️  Test : dernier backup existe... "
[ -d "$last_backup" ] && echo "✔ OK ($last_backup)" || echo "❌ KO"

echo "✅ Tests terminés."
