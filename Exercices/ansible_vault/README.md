# 🔐 Ansible Vault - Gestion Sécurisée des Secrets

Cet exercice vous apprend à utiliser Ansible Vault pour chiffrer et gérer de manière sécurisée les données sensibles comme les mots de passe, clés API, et autres secrets.

## 📁 Fichiers

- `password.yml` : Fichier chiffré contenant les mots de passe
- `prod-secrets.yml` : Secrets de production chiffrés
- `read_password.yml` : Playbook pour lire les secrets de manière sécurisée
- `template.j2` : Template utilisant les variables chiffrées
- `mail.txt` : Exemple de contenu sensible

## 🎯 Objectifs

1. **Chiffrer** des fichiers contenant des données sensibles
2. **Déchiffrer** et utiliser les secrets dans des playbooks
3. **Gérer** les mots de passe de vault
4. **Intégrer** les secrets dans des templates
5. **Sécuriser** les déploiements en production

## 🚀 Utilisation

### Création d'un fichier chiffré
```bash
# Créer un nouveau fichier chiffré
ansible-vault create password.yml

# Éditer un fichier chiffré existant
ansible-vault edit password.yml

# Chiffrer un fichier existant
ansible-vault encrypt mail.txt
```

### Exécution avec des secrets
```bash
# Exécuter un playbook avec mot de passe interactif
ansible-playbook read_password.yml --ask-vault-pass

# Utiliser un fichier de mot de passe
echo "mon_mot_de_passe_vault" > .vault_pass
ansible-playbook read_password.yml --vault-password-file .vault_pass

# Variable d'environnement
export ANSIBLE_VAULT_PASSWORD_FILE=.vault_pass
ansible-playbook read_password.yml
```

### Gestion des mots de passe
```bash
# Changer le mot de passe d'un fichier chiffré
ansible-vault rekey password.yml

# Voir le contenu sans déchiffrer définitivement
ansible-vault view password.yml

# Déchiffrer un fichier
ansible-vault decrypt password.yml
```

## 📋 Structure des Secrets

### password.yml (exemple)
```yaml
---
# Mots de passe d'application
app_passwords:
  database:
    mysql_root: "super_secret_password"
    mysql_user: "user_password_123"
  
  admin:
    username: "admin"
    password: "admin_secure_pass"

# Clés API
api_keys:
  github: "ghp_xxxxxxxxxxxxxxxxxxxx"
  aws_access_key: "AKIAIOSFODNN7EXAMPLE"
  aws_secret_key: "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
```

### prod-secrets.yml (exemple)
```yaml
---
production:
  database_url: "postgresql://user:password@prod-db:5432/myapp"
  secret_key: "prod-secret-key-very-long-and-secure"
  jwt_secret: "jwt-signing-key-production"
  
  external_services:
    smtp_password: "smtp_production_password"
    redis_password: "redis_prod_password"
```

## 🔧 Template d'Utilisation

### template.j2
```jinja2
# Configuration générée automatiquement
# NE PAS ÉDITER MANUELLEMENT

[database]
host = {{ database_host | default('localhost') }}
port = {{ database_port | default(5432) }}
username = {{ app_passwords.database.mysql_user }}
password = {{ app_passwords.database.mysql_root }}

[api]
github_token = {{ api_keys.github }}
aws_access_key = {{ api_keys.aws_access_key }}
aws_secret_key = {{ api_keys.aws_secret_key }}

[production]
{% if environment == 'production' %}
database_url = {{ production.database_url }}
secret_key = {{ production.secret_key }}
{% endif %}
```

## 🛡️ Bonnes Pratiques de Sécurité

### 1. Gestion des Mots de Passe
- **Mots de passe forts** pour le vault
- **Rotation régulière** des mots de passe
- **Stockage sécurisé** des fichiers de mots de passe
- **Accès restreint** aux fichiers vault

### 2. Organisation des Secrets
```
secrets/
├── vault_password_file    # Mot de passe du vault (non versionné)
├── dev-secrets.yml       # Secrets de développement
├── staging-secrets.yml   # Secrets de staging  
├── prod-secrets.yml      # Secrets de production
└── shared-secrets.yml    # Secrets partagés
```

### 3. Fichier .gitignore
```gitignore
# Mots de passe vault
.vault_pass
vault_password_file
*.vault_pass

# Fichiers temporaires déchiffrés
*_decrypted.yml
*_plain.yml
```

### 4. Variables d'Environnement
```bash
# Développement
export ANSIBLE_VAULT_PASSWORD_FILE=./dev_vault_pass

# Production
export ANSIBLE_VAULT_PASSWORD_FILE=/secure/path/prod_vault_pass
```

## 📖 Exemple Complet

### Playbook read_password.yml
```yaml
---
- hosts: localhost
  vars_files:
    - password.yml
    - prod-secrets.yml
  
  tasks:
    - name: Afficher les informations de connexion (masquées)
      debug:
        msg: "Connexion à la base avec l'utilisateur {{ app_passwords.database.mysql_user }}"
      no_log: true
    
    - name: Générer le fichier de configuration
      template:
        src: template.j2
        dest: /tmp/app_config.conf
        mode: '0600'  # Permissions restrictives
      
    - name: Vérifier que le fichier est créé
      stat:
        path: /tmp/app_config.conf
      register: config_file
    
    - name: Confirmer la génération
      debug:
        msg: "Configuration générée avec succès"
      when: config_file.stat.exists
```

## 🚨 Sécurité en Production

### Checklist
- [ ] Mots de passe vault différents par environnement
- [ ] Fichiers vault exclus du contrôle de version
- [ ] Permissions restrictives sur les fichiers secrets
- [ ] Audit des accès aux secrets
- [ ] Rotation régulière des secrets
- [ ] Sauvegarde sécurisée des mots de passe vault

### Commandes de Vérification
```bash
# Vérifier qu'un fichier est chiffré
file password.yml
# Sortie attendue: password.yml: data

# Lister les fichiers vault dans un projet
find . -name "*.yml" -exec ansible-vault view {} \; 2>/dev/null
```

## 📚 Ressources

- [Ansible Vault Documentation](https://docs.ansible.com/ansible/latest/user_guide/vault.html)
- [Best Practices for Secrets Management](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#variables-and-vaults)
- [Ansible Security Guide](https://docs.ansible.com/ansible/latest/user_guide/playbooks_vault.html)
