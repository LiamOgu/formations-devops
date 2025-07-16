# 📚 Exercices Ansible

Ce répertoire contient une collection d'exercices pratiques pour apprendre et maîtriser Ansible dans différents contextes.

## 📁 Exercices Disponibles

### 🔌 ansible_api/
**Utilisation de l'API Ansible**
- Intégration avec l'API REST d'Ansible
- Automation via scripts Python
- Templates Jinja2 pour la génération de configuration

**Fichiers principaux :**
- `ansible-api.yml` : Playbook d'exemple
- `template.j2` : Template Jinja2

### 💾 ansible_examples/
**Exemples d'Installation - MySQL**
- Installation automatisée de MySQL Server
- Utilisation des rôles Ansible
- Gestion des variables par hôte et groupe

**Contenu :**
- `Install_mysql_on_server.yml` : Playbook principal
- `roles/mysql/` : Rôle MySQL complet
- Variables d'environnement configurées

### 📄 ansible_templates/
**Maîtrise des Templates Jinja2**
- Génération dynamique de documentation
- Utilisation avancée des templates
- Conversion de données en Markdown

**Fichiers :**
- `generate_doc.yml` : Génération automatique de docs
- `doc.j2` : Template de documentation
- `doc.md` : Exemple de sortie générée

### 🔐 ansible_vault/
**Gestion Sécurisée des Secrets**
- Chiffrement des données sensibles
- Gestion des mots de passe
- Configuration sécurisée pour la production

**Ressources :**
- `password.yml` : Fichier de mots de passe chiffrés
- `prod-secrets.yml` : Secrets de production
- `read_password.yml` : Lecture sécurisée des secrets
- `template.j2` : Template utilisant les secrets

## 🎯 Objectifs Pédagogiques

### Niveau Débutant
1. **Syntaxe YAML** et structure des playbooks
2. **Inventaires** et gestion des hôtes
3. **Variables** et leur utilisation
4. **Modules** de base (package, service, file, etc.)

### Niveau Intermédiaire
5. **Rôles** et leur structure
6. **Templates Jinja2** et génération dynamique
7. **Handlers** et gestion des événements
8. **Conditions** et boucles

### Niveau Avancé
9. **Ansible Vault** et sécurité
10. **API Ansible** et intégration
11. **Variables complexes** et data structures
12. **Optimisation** et performance

## 🚀 Guide d'Utilisation

### Prérequis
```bash
# Installation d'Ansible
pip install ansible

# Vérification de l'installation
ansible --version
```

### Exécution des Exercices

#### 1. MySQL Installation
```bash
cd ansible_examples/
ansible-playbook -i inventory.ini Install_mysql_on_server.yml
```

#### 2. Génération de Documentation
```bash
cd ansible_templates/
ansible-playbook -i inventory.ini generate_doc.yml
```

#### 3. Utilisation d'Ansible Vault
```bash
cd ansible_vault/
# Créer un fichier chiffré
ansible-vault create secrets.yml

# Éditer un fichier chiffré
ansible-vault edit password.yml

# Exécuter avec des secrets
ansible-playbook -i inventory.ini read_password.yml --ask-vault-pass
```

#### 4. API Ansible
```bash
cd ansible_api/
ansible-playbook -i inventory.ini ansible-api.yml
```

## 📖 Bonnes Pratiques Enseignées

1. **Structure de projet** claire et organisée
2. **Séparation des préoccupations** (variables, tâches, templates)
3. **Réutilisabilité** avec les rôles
4. **Sécurité** avec Ansible Vault
5. **Documentation** du code et des processus
6. **Tests** et validation des configurations

## 🔧 Configuration

Chaque exercice contient sa propre configuration adaptée au contexte d'apprentissage. Consultez le fichier `ansible.cfg` de chaque répertoire pour les paramètres spécifiques.

## 📚 Ressources Complémentaires

- [Ansible Documentation](https://docs.ansible.com/)
- [Jinja2 Templates](https://jinja.palletsprojects.com/)
- [Ansible Galaxy](https://galaxy.ansible.com/)
- [YAML Syntax](https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html)
