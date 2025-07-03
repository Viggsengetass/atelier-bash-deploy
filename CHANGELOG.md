# Changelog

Toutes les modifications notables apportées à ce projet seront documentées dans ce fichier.

Le format est basé sur [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/) et ce projet suit [Semantic Versioning](https://semver.org/lang/fr/).

---

## [Unreleased]

### Ajouté
- Script `menu.sh` pour une interface CLI interactive
- Hook Git `post-merge` déclenchant un déploiement
- Intégration continue via GitHub Actions
- Structure de répertoire avec sauvegardes automatiques

---

## [v1.0.0] - 2025-07-03

### Ajouté
- Script `deploy.sh` pour le déploiement initial
- Script `rollback.sh` pour restaurer une version précédente
- Script `test_deploy.sh` pour vérifier l’état du déploiement
- Script `setup.sh` pour installer les hooks Git

### Modifié
- README initialisé avec badge de CI et explications d’usage



## [v1.1.0] - 2025-07-03

### Ajouté
- Versionning