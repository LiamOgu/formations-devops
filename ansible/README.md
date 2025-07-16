# 🔧 Ansible - Formations et Configurations

Ce répertoire contient l'ensemble des ressources Ansible pour les différentes formations et projets.

## 📁 Structure

### 🎓 Formations

#### **Capgipi_P6_2025/**
Formation Ansible pour Capgemini P6 2025
- Configuration Ansible complète
- Inventaires et variables
- Exemples d'utilisation

#### **M1IL-Ansible-25/**
Formation Ansible pour M1 Ingénierie Logicielle 2025
- Playbooks Bootstrap et Grafana
- Rôles structurés
- Configuration de laboratoire

#### **M1IL-SOPRA-25/**
Formation Ansible SOPRA M1 2025
- Installation Grafana
- Configuration spécifique SOPRA

#### **Tahiti-septembre-2024/**
Formation Ansible Tahiti septembre 2024
- Cas d'usage variés
- Exemples réseau et sécurité
- Ansible Vault

### 🔨 Ressources Partagées

#### **roles/**
Rôles Ansible réutilisables :
- **gitlab/** : Installation et configuration GitLab

#### **install_gitlab.yml**
Playbook principal pour l'installation GitLab

## 🚀 Utilisation

### Installation GitLab
```bash
ansible-playbook -i inventory.ini install_gitlab.yml
```

### Structure type d'un projet Ansible
```
projet/
├── ansible.cfg          # Configuration Ansible
├── inventory.ini        # Inventaire des serveurs
├── playbooks/          # Playbooks principaux
├── roles/              # Rôles personnalisés
├── group_vars/         # Variables de groupes
└── host_vars/          # Variables d'hôtes
```

## 📖 Bonnes Pratiques

1. **Structure des rôles** : Utilisez la structure standard Ansible
2. **Variables** : Organisez vos variables par groupe et par hôte
3. **Sécurité** : Utilisez Ansible Vault pour les secrets
4. **Tests** : Testez vos playbooks en mode dry-run
5. **Documentation** : Documentez vos rôles et playbooks

## 🔧 Configuration

Chaque formation contient sa propre configuration `ansible.cfg` adaptée au contexte pédagogique.

## 📚 Ressources

- [Documentation Ansible](https://docs.ansible.com/)
- [Ansible Galaxy](https://galaxy.ansible.com/)
- [Bonnes pratiques Ansible](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html)
