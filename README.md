
md
Copier
Modifier
# 🛠️ Atelier Bash Deploy

Un mini-projet pour apprendre à automatiser le déploiement d’un site statique en Bash avec :

- ✅ Sauvegarde automatique (rollback)
- ✅ Déploiement de `src/index.html` dans `deploy_prod/`
- ✅ Log de déploiement (`deploy_log.txt`)
- ✅ Tests automatisés de validation post-déploiement
- ✅ Notification système (selon OS)
- ✅ Hook Git `post-merge` pour lancer le déploiement après un `git pull`
- ✅ Script `setup.sh` pour activer facilement le hook
- ✅ Prise en charge multiplateforme (Linux, macOS, Windows)

---

## 📦 Structure du projet

atelier-bash-deploy/
├── src/index.html # Fichier source à déployer
├── deploy.sh # Script principal de déploiement
├── test_deploy.sh # Suite de tests de validation post-déploiement
├── setup.sh # Installation automatique du hook Git post-merge
├── post-merge # Fichier hook Git à copier dans .git/hooks/
├── .env # Fichier de configuration des variables (ex: DEPLOY_DIR)
├── deploy_log.txt # Log de tous les déploiements
├── deploy_prod/ # Répertoire de destination pour le déploiement
├── deploy_backups/ # Sauvegardes automatiques en cas de rollback

yaml
Copier
Modifier

---

## 🚀 Déploiement

Lance manuellement un déploiement avec :

```bash
./deploy.sh deploy
🔄 Rollback
Restaure la dernière version sauvegardée avec :

bash
Copier
Modifier
./deploy.sh rollback
🧪 Tests
Exécute les tests automatisés (structure du déploiement, log, etc.) :

bash
Copier
Modifier
./test_deploy.sh
🔔 Notifications système
Une notification s'affiche à la fin du déploiement selon ton OS :

Linux : notify-send

macOS : osascript

Windows : start

🪝 Hook Git : post-merge
Le hook post-merge déclenche automatiquement le déploiement après un git pull :

📌 Installation du hook
Lance simplement :

bash
Copier
Modifier
./setup.sh
Cela copie automatiquement le fichier post-merge dans .git/hooks/ et le rend exécutable.

⚙️ Fichier .env
Fichier de configuration pour centraliser les chemins :

env
Copier
Modifier
DEPLOY_DIR=./deploy_prod
BACKUP_DIR=./deploy_backups
SRC_FILE=./src/index.html
LOG_FILE=./deploy_log.txt
✅ Bonus
Le deploy.sh détecte l'OS pour utiliser la bonne commande d'ouverture ou notification.

Tu peux facilement étendre les tests ou ajouter d'autres fichiers à déployer.

🧠 Pour aller plus loin
Ajouter un pre-commit pour vérifier que src/index.html est bien modifié

Ajouter une vérification de la validité HTML avec un validateur local

Intégration continue via GitHub Actions pour exécuter les tests automatiquement

✍️ Auteur
Paul Antoine — Projet pédagogique Bash – Automatisation déploiement statique