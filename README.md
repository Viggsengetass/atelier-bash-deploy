# 🛠️ Atelier Bash Deploy

Ce projet illustre un exemple de **déploiement automatisé** à l'aide d'un **hook Git `post-merge`**.

---

## 🔄 Fonctionnement

- Le script `deploy.sh` copie les fichiers du dossier `src/` dans le dossier `deploy_prod/`
- Ce script est automatiquement lancé grâce à un hook `post-merge` placé dans `.git/hooks/`
- Chaque déploiement est **loggué** avec la date dans le fichier `deploy_log.txt`
- Il est possible de consulter les **derniers logs** avec une commande `status`

---

## 🗂️ Structure du projet

├── deploy.sh # Script de déploiement
├── src/index.html # Fichier à déployer (dans le dossier source)
├── deploy_prod/ # Dossier cible du déploiement
├── deploy_log.txt # Historique des déploiements
├── .git/hooks/post-merge # Hook de déploiement automatique
└── README.md # Documentation du projet

yaml
Copier
Modifier

---

## 🚀 Lancer un déploiement

Le déploiement est **automatique** lors d’un `git merge`.  
Mais tu peux aussi l’exécuter manuellement :

```bash
./deploy.sh deploy
📋 Vérifier les derniers déploiements
Pour afficher les 5 derniers logs de déploiement, lance :

bash
Copier
Modifier
./deploy.sh status