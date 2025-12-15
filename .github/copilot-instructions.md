# Copilot Instructions - Repository de Formations IaC

## Architecture du Repository

Ce repository contient des ressources pédagogiques pour formations DevOps/IaC, organisé par technologie :

```
formations/
├── ansible/           # Playbooks, rôles et configurations Ansible par formation
├── Terraform/         # Configurations Terraform (AWS principalement)
├── conteneurs/        # Docker et Kubernetes (Dockerfiles, manifests K8s)
├── Exercices/         # TPs pratiques (vault, templates, API)
├── intro-devops/      # Outils d'analyse de code (linters, sécurité)
└── Templates/         # Templates Jinja2 réutilisables
```

## Conventions par Technologie

### Ansible
- **Structure des rôles** : Suivre la structure standard Ansible Galaxy (`tasks/`, `handlers/`, `defaults/`, `templates/`, `vars/`)
- **Fichier de configuration** : Chaque formation a son `ansible.cfg` avec `inventory=./inventory.ini`
- **Collections** : Utiliser `ansible.builtin.*` pour les modules standards
- **Inventaires** : Format INI ou YAML selon la formation, grouper par environnement

Exemple de référence : `ansible/roles/gitlab/`

### Terraform
- **Naming des fichiers** : Préfixe numéroté pour l'ordre logique (`02_eip.tf`, `03_security_groups.tf`, `10_virtual_machines.tf`)
- **Structure standard** : `providers.tf`, `variables.tf`, `data.tf`, `output.tf`
- **Région AWS par défaut** : `eu-west-3` (Paris)
- **Scripts d'init** : `bootstrap.sh` pour la configuration post-déploiement

Exemple de référence : `Terraform/M1IL-25-26/`

### Docker/Kubernetes
- **Images de base** : Préférer les images `slim` (ex: `python:3.14.0-slim`)
- **Manifests K8s** : Séparés par ressource (`*-deployment.yml`, `*-service.yml`)
- **Namespaces** : Utiliser `namespace.yml` dédié

Exemple de référence : `conteneurs/tahiti-septembre-24-docker-kube/`

### Python (intro-devops)
- **Outils d'analyse** : flake8, pylint, bandit
- **Style** : PEP8, docstrings pour les fonctions

## Workflows Courants

```bash
# Ansible - Exécuter un playbook
cd ansible/<formation>/
ansible-playbook -i inventory.ini playbook.yml

# Terraform - Déployer
cd Terraform/<projet>/
terraform init
terraform plan
terraform apply

# Docker - Build et run
docker build -t <image> .
docker run -p 8000:8000 <image>

# Analyse de code Python
pip install flake8 pylint bandit
flake8 <fichier.py>
bandit <fichier.py>
```

## Points d'Attention

- **Secrets Ansible** : Utiliser `ansible-vault` pour les données sensibles (voir `Exercices/ansible_vault/`)
- **Variables Terraform** : Ne jamais commiter de credentials, utiliser les profils AWS CLI
- **Documentation** : Chaque module/formation doit avoir son `README.md`
