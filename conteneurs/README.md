# 🐳 Conteneurs - Docker & Kubernetes

Ce répertoire contient les ressources pour la formation sur la containerisation avec Docker et l'orchestration avec Kubernetes.

## 📁 Structure

### 🏝️ tahiti-septembre-24-docker-kube/
Formation Docker/Kubernetes dispensée à Tahiti en septembre 2024

**Contenu :**
- `Dockerfile` : Image Python avec serveur HTTP
- `namespace.yml` : Configuration des namespaces Kubernetes
- `values.yml` : Valeurs pour les charts Helm
- `mysql/` : Déploiement MySQL sur Kubernetes
- `nginx/` : Déploiement Nginx sur Kubernetes

## 🎯 Objectifs Pédagogiques

### Docker
1. **Création d'images** personnalisées
2. **Optimisation** des Dockerfiles
3. **Multi-stage builds**
4. **Gestion des volumes** et réseaux
5. **Docker Compose** pour les applications multi-conteneurs

### Kubernetes
1. **Déploiements** (Deployments)
2. **Services** et exposition
3. **ConfigMaps** et Secrets
4. **Namespaces** et isolation
5. **Persistent Volumes**
6. **Ingress** et routage

## 🚀 Exemples Pratiques

### Image Python HTTP Server
```dockerfile
# Image légère avec Python 3.13
FROM python:3.13.2-slim
WORKDIR /app
EXPOSE 8000
ENTRYPOINT ["python3", "-m", "http.server", "8000"]
```

### Déploiement MySQL
- Configuration complète MySQL sur Kubernetes
- Secrets pour les mots de passe
- Service pour l'exposition
- Volumes persistants

### Déploiement Nginx
- Serveur web Nginx
- Configuration personnalisée
- Service LoadBalancer
- Exemples de commandes

## 🔧 Utilisation

### Docker
```bash
# Construction de l'image
docker build -t python-http-server .

# Exécution du conteneur
docker run -p 8000:8000 python-http-server

# Accès à l'application
curl http://localhost:8000
```

### Kubernetes
```bash
# Création du namespace
kubectl apply -f namespace.yml

# Déploiement MySQL
kubectl apply -f mysql/

# Déploiement Nginx
kubectl apply -f nginx/

# Vérification des déploiements
kubectl get pods -n formation
kubectl get services -n formation
```

## 📋 Ressources Kubernetes

### MySQL
- **mysql-deployment.yml** : Déploiement de l'application
- **mysql-service.yml** : Service d'exposition
- **mysql-opaque.yml** : Secrets et configuration

### Nginx
- **nginx-deployment.yml** : Déploiement du serveur web
- **nginx-service.yml** : Service LoadBalancer
- **command_example.yaml** : Exemples de commandes

## 🛠️ Bonnes Pratiques

### Docker
1. **Images légères** (Alpine, slim)
2. **Multi-stage builds** pour optimiser la taille
3. **Non-root user** pour la sécurité
4. **Health checks** pour la supervision
5. **Labels** pour la documentation

### Kubernetes
1. **Namespaces** pour l'isolation
2. **Resource limits** et requests
3. **Liveness/Readiness probes**
4. **ConfigMaps** pour la configuration
5. **Secrets** pour les données sensibles

## 🔍 Monitoring et Debugging

### Commandes utiles
```bash
# Logs des conteneurs
kubectl logs -f deployment/mysql -n formation

# Description des ressources
kubectl describe pod <pod-name> -n formation

# Exécution dans un conteneur
kubectl exec -it <pod-name> -n formation -- /bin/bash

# Port forwarding
kubectl port-forward service/nginx 8080:80 -n formation
```

## 📚 Ressources Complémentaires

- [Docker Documentation](https://docs.docker.com/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Helm Charts](https://helm.sh/)
- [Best Practices](https://kubernetes.io/docs/concepts/configuration/overview/)
