# 🛠️ Atelier Bash Deploy

Ce projet illustre un exemple de **déploiement automatisé** à l'aide d'un **hook Git `post-merge`**.

## 🔄 Fonctionnement

- Le script `deploy.sh` copie le fichier `index.html` dans le dossier `deploy_prod/`
- Ce script est automatiquement lancé grâce à un hook `post-merge` placé dans `.git/hooks/`
- Chaque déploiement est loggué avec la date dans le fichier `deploy_log.txt`

## 🗂️ Structure du projet

├── deploy.sh # Script de déploiement
├── index.html # Fichier à déployer
├── README.md # Documentation du projet
├── deploy_log.txt # Historique des déploiements
└── deploy_prod/ # Dossier cible du déploiement

markdown
Copier
Modifier

## 🚀 Lancer un déploiement

Le déploiement est automatique lors d'un `git merge`.  
Mais tu peux aussi l’exécuter manuellement :

```bash
./deploy.sh