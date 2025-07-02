# Atelier Bash Deploy

[![CI - Test Déploiement](https://github.com/Viggsgenetass/atelier-bash-deploy/actions/workflows/test-deploy.yml/badge.svg)](https://github.com/Viggsgenetass/atelier-bash-deploy/actions/workflows/test-deploy.yml)

Ce projet propose une solution de déploiement automatisée simple et efficace à l’aide de scripts Bash. Il intègre des fonctionnalités essentielles pour gérer les déploiements, les tests, les sauvegardes et les restaurations.

## Fonctionnalités

- **Déploiement automatisé** avec sauvegarde automatique
- **Tests post-déploiement** (existence de fichiers, logs, etc.)
- **Rollback automatique** vers la dernière version stable en cas d’erreur
- **Interface CLI interactive** pour faciliter l’usage
- **Hook Git `post-merge`** pour déclencher un déploiement automatiquement après un merge
- **Intégration continue** via GitHub Actions pour lancer les tests à chaque `push` ou `pull request` sur `main`

## Structure

```bash
.
├── deploy.sh            # Script principal de déploiement
├── rollback.sh          # Script de restauration (rollback)
├── test_deploy.sh       # Script de tests post-déploiement
├── menu.sh              # Menu CLI interactif
├── setup.sh             # Installation du hook post-merge
├── post-merge           # Hook Git déclenchant le déploiement
├── deploy_prod/         # Répertoire cible du déploiement
├── deploy_backups/      # Sauvegardes avant chaque déploiement
├── .env                 # Fichier de configuration (non versionné)
├── deploy_log.txt       # Historique des déploiements
└── .github/
    └── workflows/
        └── test-deploy.yml   # CI GitHub Actions pour les tests
```

## Installation

```bash
chmod +x setup.sh
./setup.sh
```

Cela installera le hook Git `post-merge` automatiquement.

## Utilisation

### Déploiement manuel

```bash
./deploy.sh deploy
```

### Tests post-déploiement

```bash
./test_deploy.sh
```

### Rollback automatique

```bash
./rollback.sh
```

### Menu interactif

```bash
./menu.sh
```

## CI - Intégration Continue

Les tests de déploiement sont exécutés automatiquement via **GitHub Actions** sur chaque push ou pull request sur `main`. Voir `.github/workflows/test-deploy.yml`.

Déploiement avec Ansible

Le projet propose une alternative moderne aux scripts Bash grâce à un playbook Ansible complet. Il permet de gérer le cycle de vie du déploiement de manière déclarative, automatisée et maintenable.

📁 Structure du dossier ansible/

ansible/
├── ansible.cfg         # Configuration locale d’Ansible
├── deploy.yml          # Playbook principal (déploiement, rollback, statut)
├── inventory.ini       # Inventaire des hôtes (par défaut : localhost)
└── group_vars/
    └── all.yml         # Variables globales issues du .env

🧠 Fonctionnalités principales

✅ Création des répertoires de déploiement et de sauvegarde

🔁 Backup automatique de l’ancien état avant chaque déploiement

📂 Copie des fichiers de src/ vers deploy_prod/

🕒 Journalisation de chaque déploiement dans deploy_log.txt

🔍 Commande --tags status pour afficher le dernier backup

⏪ Commande --tags rollback pour restaurer le dernier backup

🔐 Vérification de la branche Git main avant déploiement

▶️ Commandes utiles

Depuis la racine du projet :

# Déploiement
ansible-playbook -i ansible/inventory.ini ansible/deploy.yml --tags deploy

# Voir le statut
ansible-playbook -i ansible/inventory.ini ansible/deploy.yml --tags status

# Rollback
ansible-playbook -i ansible/inventory.ini ansible/deploy.yml --tags rollback

⚙️ Configuration personnalisable

Dans ansible/group_vars/all.yml :

deploy_dir: "./deploy_prod"
backup_dir: "./deploy_backups"
log_file: "deploy_log.txt"
src_dir: "../src"

Ces variables peuvent aussi être surchargées à l’exécution :

ansible-playbook deploy.yml -e "deploy_dir=/var/www/html"

✨ Cette solution est idéale pour les environnements CI/CD, les déploiements distants, et les projets évolutifs.

Utilisation

Déploiement manuel (Bash)

./deploy.sh deploy

Déploiement via Ansible (recommandé en CI ou environnement pro)

# Déploiement complet
ansible-playbook -i ansible/inventory.ini ansible/deploy.yml --tags deploy

# Voir le statut
ansible-playbook -i ansible/inventory.ini ansible/deploy.yml --tags status

# Rollback vers le dernier backup
ansible-playbook -i ansible/inventory.ini ansible/deploy.yml --tags rollback

Le playbook Ansible crée automatiquement les répertoires, sauvegarde l'ancien déploiement, copie les fichiers, journalise la date et permet un rollback.


## Auteurs

- Paul Antoine , Teddy Fontep — CESI 2025 — Projet Atelier Bash
