# TP - Analyse de Code avec Linters et Bandit

## Objectif

Découvrir les outils d'analyse statique de code Python :
- **flake8** : Vérification du style PEP8
- **pylint** : Analyse statique approfondie
- **bandit** : Détection de failles de sécurité

## Installation

### 1. Installer uv (gestionnaire de packages Python moderne)

```bash
# macOS / Linux
curl -LsSf https://astral.sh/uv/install.sh | sh

# Ou avec Homebrew (macOS)
brew install uv
```

### 2. Créer et activer l'environnement virtuel

```bash
cd intro-devops
uv venv
source .venv/bin/activate
```

### 3. Installer les dépendances

```bash
uv pip install flake8 pylint bandit pyyaml
```

## Exercice

Le fichier `vulnerable_app.py` contient volontairement des erreurs de style et des failles de sécurité.

### Étape 1 : Analyse avec flake8

```bash
flake8 vulnerable_app.py
```

Notez les erreurs de style (lignes trop longues, espaces manquants, etc.)

### Étape 2 : Analyse avec pylint

```bash
pylint vulnerable_app.py
```

Observez le score et les recommandations.

### Étape 3 : Analyse de sécurité avec Bandit

```bash
bandit vulnerable_app.py
```

Identifiez les failles de sécurité détectées.

## Travail demandé

1. Exécuter les 3 outils sur le fichier
2. Lister les problèmes trouvés par chaque outil
3. Corriger le code pour éliminer les erreurs
4. Relancer les analyses pour vérifier vos corrections

## Ressources

- [Documentation uv](https://docs.astral.sh/uv/)
- [Documentation flake8](https://flake8.pycqa.org/)
- [Documentation pylint](https://pylint.readthedocs.io/)
- [Documentation Bandit](https://bandit.readthedocs.io/)
