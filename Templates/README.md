# 📋 Templates - Ressources Réutilisables

Ce répertoire contient une collection de templates et de fichiers de configuration réutilisables pour différents outils et technologies utilisés dans les formations.

## 📁 Contenu

### 🐳 docker-compose.j2
**Template Docker Compose avec Jinja2**
- Configuration multi-services
- Variables dynamiques
- Environnements configurables
- Volumes et réseaux personnalisables

### 📦 requirements.txt
**Dépendances Python**
- Packages essentiels pour les formations
- Versions compatibles
- Installation automatisée avec pip

## 🎯 Utilisation des Templates

### Docker Compose Template
Le template `docker-compose.j2` utilise la syntaxe Jinja2 pour permettre une configuration dynamique :

```yaml
# Exemple d'utilisation
version: '3.8'
services:
  {{ service_name }}:
    image: {{ image_name }}:{{ image_tag | default('latest') }}
    environment:
      - ENV={{ environment | default('development') }}
    ports:
      - "{{ port | default(8080) }}:8080"
```

### Génération avec Ansible
```bash
# Utilisation du template avec Ansible
ansible-playbook -e service_name=webapp -e image_name=nginx deploy.yml
```

## 🔧 Configuration

### Variables Courantes
- `service_name` : Nom du service
- `image_name` : Nom de l'image Docker
- `image_tag` : Tag de l'image (défaut: latest)
- `environment` : Environnement (dev/staging/prod)
- `port` : Port d'exposition
- `volumes` : Configuration des volumes
- `networks` : Configuration réseau

### Requirements Python
Les dépendances incluent généralement :
- **ansible** : Automation et configuration
- **docker** : Client Docker Python
- **jinja2** : Moteur de templates
- **pyyaml** : Parser YAML
- **requests** : Client HTTP

## 🚀 Exemples d'Utilisation

### 1. Déploiement Web App
```jinja2
services:
  webapp:
    image: {{ app_image }}
    environment:
      - DATABASE_URL={{ db_url }}
      - SECRET_KEY={{ secret_key }}
    depends_on:
      - database
```

### 2. Stack de Monitoring
```jinja2
services:
  prometheus:
    image: prom/prometheus:{{ prometheus_version }}
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
  
  grafana:
    image: grafana/grafana:{{ grafana_version }}
    environment:
      - GF_SECURITY_ADMIN_PASSWORD={{ grafana_password }}
```

### 3. Base de Données
```jinja2
services:
  database:
    image: {{ db_type }}:{{ db_version }}
    environment:
      - MYSQL_ROOT_PASSWORD={{ root_password }}
      - MYSQL_DATABASE={{ database_name }}
    volumes:
      - db_data:/var/lib/mysql
```

## 📖 Bonnes Pratiques

### Templates
1. **Variables par défaut** pour éviter les erreurs
2. **Validation** des entrées
3. **Documentation** des variables requises
4. **Modularité** et réutilisabilité
5. **Versionning** des templates

### Structure
```
templates/
├── docker-compose.j2      # Template principal
├── nginx.conf.j2          # Configuration Nginx
├── prometheus.yml.j2      # Configuration Prometheus
├── vars/
│   ├── development.yml    # Variables dev
│   ├── staging.yml        # Variables staging
│   └── production.yml     # Variables prod
└── README.md             # Documentation
```

## 🔍 Validation

### Vérification des Templates
```bash
# Test de rendu avec Ansible
ansible all -i localhost, -c local -m template \
  -a "src=docker-compose.j2 dest=/tmp/docker-compose.yml" \
  -e "service_name=test"

# Validation Docker Compose
docker-compose -f /tmp/docker-compose.yml config
```

### Linting
```bash
# YAML Lint
yamllint docker-compose.j2

# Ansible Lint (pour les templates Ansible)
ansible-lint template-playbook.yml
```

## 🎨 Personnalisation

### Ajout de Nouveaux Templates
1. Créer le fichier `.j2`
2. Définir les variables nécessaires
3. Documenter l'utilisation
4. Tester avec différents jeux de variables
5. Ajouter aux exemples

### Variables Dynamiques
```jinja2
{% if environment == 'production' %}
replicas: 3
resources:
  limits:
    memory: 1Gi
    cpu: 500m
{% else %}
replicas: 1
resources:
  limits:
    memory: 512Mi
    cpu: 250m
{% endif %}
```

## 📚 Ressources

- [Jinja2 Documentation](https://jinja.palletsprojects.com/)
- [Docker Compose Reference](https://docs.docker.com/compose/)
- [Ansible Templates](https://docs.ansible.com/ansible/latest/user_guide/playbooks_templating.html)
- [YAML Specification](https://yaml.org/spec/)
