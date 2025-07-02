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

## Auteurs

- Paul Antoine — CESI 2025 — Projet Atelier Bash
