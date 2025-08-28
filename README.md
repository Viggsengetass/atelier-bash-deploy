# 🤪 atelier-bash-deploy

Projet de déploiement automatisé Bash avec interface CLI, tests et CI/CD GitHub Actions.
Réalisé dans le cadre d’un exercice en équipe visant à construire une chaîne de déploiement complète et modulable sans utiliser Docker ou un framework externe.

---

## 🔧 Fonctionnalités principales

* **Déploiement de fichiers** avec sauvegarde automatique (`deploy.sh`)
* **Logs de déploiement** complets et horodatés (`deploy_log.txt`)
* **Interface CLI interactive** (`menu.sh`)
* **Rollback automatique** vers le dernier backup (`rollback.sh`)
* **Variables d’environnement** centralisées via `.env`
* **Hook Git `post-merge`** pour déclencher automatiquement le déploiement (`post-merge`, `setup.sh`)
* **Tests automatisés Bash** pour valider les déploiements (`test_deploy.sh`)
* **Intégration Continue (CI)** avec GitHub Actions (`.github/workflows/test-deploy.yml`)
* **Tests unitaires Bash** (via `bats`) pour valider les fonctions critiques
* **Déploiement continu (CD)** vers AWS (S3 ou EC2)

---

## 📁 Arborescence du projet

```
atelier-bash-deploy/
├── .github/workflows/
│   ├── test-deploy.yml       # CI tests post-déploiement
│   ├── unit-tests.yml        # CI tests unitaires Bash
│   └── deploy-to-aws.yml     # CD déploiement AWS
├── deploy.sh                 # Script de déploiement principal
├── rollback.sh               # Script de restauration automatique
├── menu.sh                   # Interface CLI interactive
├── test_deploy.sh            # Script de tests post-déploiement
├── setup.sh                  # Installe les hooks Git
├── post-merge                # Hook déclenchant un déploiement après merge
├── .env                      # Variables de configuration
├── deploy_backups/           # Backups horodatés
├── deploy_prod/              # Répertoire cible du déploiement
├── src/                      # Fichiers sources à déployer
├── deploy_log.txt            # Log des opérations
├── tests/                    # Tests unitaires Bash (bats)
│   └── test_config.bats      # Exemple de test unitaire
├── README.md                 # Documentation du projet
├── CHANGELOG.md              # Historique des versions
```

---

## 🚀 Lancer le projet

### 1. Configurer `.env`

```env
SRC_DIR=./src
DEPLOY_DIR=./deploy_prod
BACKUP_DIR=./deploy_backups
LOG_FILE=./deploy_log.txt
MAX_BACKUPS=5
```

### 2. Lancer manuellement

```bash
chmod +x *.sh
./deploy.sh
```

### 3. Utiliser l’interface interactive

```bash
./menu.sh
```

---

## 🤪 Lancer les tests

### Tests post-déploiement

```bash
./test_deploy.sh
```

> Vérifie :
>
> * L’existence du dossier de déploiement
> * La copie des fichiers
> * L’enregistrement du log
> * La date du dernier log
> * L’existence du backup

### Tests unitaires Bash (via `bats`)

```bash
bats tests/
```

> Vérifie :
>
> * La bonne lecture des variables `.env`
> * Le respect du nombre max de backups
> * La gestion des erreurs (ex: répertoire introuvable)
> * Les fonctions utilitaires des scripts

---

## 🔄 Automatiser avec Git

### 1. Installation du hook `post-merge`

```bash
./setup.sh
```

> Installe un hook Git local `.git/hooks/post-merge` déclenchant automatiquement `./deploy.sh` après chaque fusion (`git merge`).

---

## ⚙️ Intégration Continue (CI)

Chaque `push` ou `pull_request` sur `main` déclenche GitHub Actions :

* **Job `lint/test`** → exécute les tests unitaires Bash (`bats`) et post-déploiement (`test_deploy.sh`)
* **Job `deploy`** → déclenché uniquement après **merge sur `main`**, déploie vers AWS (S3 ou EC2)

### 🔖 Badges CI/CD

![CI Tests](https://github.com/Viggsengetass/atelier-bash-deploy/actions/workflows/test-deploy.yml/badge.svg)
![Unit Tests](https://github.com/Viggsengetass/atelier-bash-deploy/actions/workflows/unit-tests.yml/badge.svg)
![AWS Deploy](https://github.com/Viggsengetass/atelier-bash-deploy/actions/workflows/deploy-to-aws.yml/badge.svg)

---

## ☁️ Déploiement AWS

### 1. Secrets GitHub à configurer

Dans **Settings > Secrets > Actions** :

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_DEFAULT_REGION` (ex: `eu-west-3`)

### 2. Déploiement vers S3

Pour un site statique :

```bash
aws s3 sync deploy_prod/ s3://mon-bucket-s3 --delete
```

### 3. Déploiement vers EC2

Pour un serveur applicatif :

```bash
scp -r deploy_prod/* ec2-user@MON_IP:/var/www/html/
```

---

## 🦯 Roadmap

* [x] Tests automatisés Bash (post-déploiement)
* [x] CI GitHub Actions pour les tests
* [ ] Ajout de **tests unitaires Bash** (via `bats`)
* [ ] Nouveau workflow GitHub Actions pour **déploiement AWS (S3 ou EC2)**
* [ ] Centralisation avancée de la configuration AWS (`aws-config.sh`)
* [ ] Amélioration de l’interface CLI (choix de versions à rollback, etc.)

---

## 👥 Contributeurs

* **Paul Antoine**
* **Teddy Fontep** 
* **Timo Timo Timo**

---

## 📜 Licence

Projet pédagogique libre – Vous pouvez l’adapter et l’utiliser comme base de vos propres outils internes.
