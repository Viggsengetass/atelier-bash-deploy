#!/bin/bash

# Vérifie l'existence de dossiers de backup
latest_backup=$(ls -dt deploy_backups/*/ 2>/dev/null | head -n 1)

if [ -z "$latest_backup" ]; then
  echo "Aucune sauvegarde trouvée dans deploy_backups/."
  exit 1
fi

echo "Dernière sauvegarde trouvée : $latest_backup"
read -p "Confirmer le rollback vers cette sauvegarde ? (o/n) : " confirm

if [[ "$confirm" != "o" ]]; then
  echo "Rollback annulé."
  exit 0
fi

# Supprime le dossier actuel
rm -rf deploy_prod

# Restaure la sauvegarde
cp -r "$latest_backup" deploy_prod

echo "Rollback effectué depuis $latest_backup."
