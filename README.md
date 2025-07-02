# Atelier Bash Deploy

## Description

Ce projet est un atelier Bash visant à apprendre à automatiser un déploiement simple de site statique (ex. : `index.html`) avec :

- Sauvegarde automatique de l’ancien déploiement (`deploy_backups/`)
- Copie des fichiers vers un répertoire de production (`deploy_prod/`)
- Ajout d’un log horodaté de chaque déploiement (`deploy_log.txt`)
- Notification sonore de fin de déploiement selon l’OS
- Possibilité de rollback manuel via les backups

## Structure du projet

.
├── deploy.sh # Script principal de déploiement
├── test_deploy.sh # Script de tests post-déploiement
├── setup.sh # Script d'installation automatique du hook post-merge
├── post-merge # Hook Git exécuté automatiquement après un merge
├── .env # Variables d’environnement (répertoire, nom de fichier, etc.)
├── deploy_log.txt # Log des déploiements horodatés
├── deploy_prod/ # Répertoire de destination du déploiement
├── deploy_backups/ # Répertoire de sauvegardes des anciens déploiements
├── .github/workflows/ # Workflows GitHub Actions pour CI
└── src/
└── index.html # Fichier HTML source à déployer

markdown
Copier
Modifier

## Fonctionnalités

- 💾 **Backup automatique** avec horodatage (`deploy_backups/`)
- 🚀 **Déploiement scripté** avec log et vérifications
- ✅ **Tests automatisés** post-déploiement
- 🔄 **Hook Git post-merge** : déclenchement auto du déploiement + tests
- 🔧 **Script `setup.sh`** pour configurer automatiquement le hook
- 🧪 **CI GitHub Actions** : tests déclenchés à chaque `push` ou `pull request` sur `main`
- 🧠 **Portabilité** : compatible Windows/macOS/Linux (avec détection OS)

## Utilisation

### 1. Déploiement manuel

```bash
./deploy.sh deploy
2. Lancer les tests à la main
bash
Copier
Modifier
./test_deploy.sh
3. Installer le hook Git post-merge
bash
Copier
Modifier
./setup.sh
Après un merge Git, cela lancera automatiquement :

Le script deploy.sh

Puis les tests via test_deploy.sh

4. GitHub Actions
Chaque push ou pull request sur main déclenche un job CI qui exécute :

chmod +x test_deploy.sh

./test_deploy.sh