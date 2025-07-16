# 🐳 Formation Docker & Kubernetes - Tahiti Septembre 2024

Formation pratique sur la containerisation avec Docker et l'orchestration avec Kubernetes, dispensée à Tahiti en septembre 2024.

## 📁 Structure

```
tahiti-septembre-24-docker-kube/
├── Dockerfile              # Image Python HTTP Server
├── namespace.yml           # Namespace Kubernetes
├── values.yml             # Valeurs Helm
├── json_moche.txt         # Données d'exemple
├── mysql/                 # Stack MySQL
│   ├── mysql-deployment.yml
│   ├── mysql-service.yml
│   └── mysql-opaque.yml
└── nginx/                 # Stack Nginx
    ├── nginx-deployment.yml
    ├── nginx-service.yml
    └── command_example.yaml
```

## 🎯 Objectifs de Formation

### Docker
1. **Création d'images** personnalisées avec Dockerfile
2. **Optimisation** des images (multi-stage, layers)
3. **Gestion des volumes** et persistance
4. **Réseaux Docker** et communication inter-conteneurs
5. **Docker Compose** pour applications multi-services

### Kubernetes
1. **Déploiements** (Deployments) et gestion des pods
2. **Services** et découverte de services
3. **ConfigMaps** et Secrets pour la configuration
4. **Volumes persistants** pour les données
5. **Namespaces** et isolation des ressources

## 🚀 Travaux Pratiques

### TP1 : Image Python HTTP Server

**Objectif :** Créer une image Docker légère pour servir des fichiers statiques

```dockerfile
FROM python:3.13.2-slim
WORKDIR /app
EXPOSE 8000
ENTRYPOINT ["python3", "-m", "http.server", "8000"]
```

**Commandes :**
```bash
# Construction
docker build -t python-http-server .

# Test local
docker run -p 8000:8000 python-http-server

# Vérification
curl http://localhost:8000
```

### TP2 : Namespace Kubernetes

**Objectif :** Organiser les ressources avec des namespaces

```bash
# Création du namespace
kubectl apply -f namespace.yml

# Vérification
kubectl get namespaces
kubectl get pods -n formation
```

### TP3 : Déploiement MySQL

**Objectif :** Déployer une base de données avec persistance

**Ressources :**
- **mysql-deployment.yml** : Pod MySQL avec volume persistant
- **mysql-service.yml** : Service pour l'accès à la DB
- **mysql-opaque.yml** : Secrets pour les mots de passe

```bash
# Déploiement complet
kubectl apply -f mysql/

# Vérification
kubectl get pods -n formation
kubectl get services -n formation
kubectl get secrets -n formation

# Test de connexion
kubectl exec -it deployment/mysql -n formation -- mysql -u root -p
```

### TP4 : Déploiement Nginx

**Objectif :** Serveur web avec exposition externe

**Ressources :**
- **nginx-deployment.yml** : Déploiement du serveur web
- **nginx-service.yml** : Service LoadBalancer
- **command_example.yaml** : Exemples de commandes utiles

```bash
# Déploiement
kubectl apply -f nginx/

# Accès au service
kubectl get services -n formation
# Récupérer l'IP externe et tester
curl http://<EXTERNAL-IP>
```

## 🔧 Configuration Avancée

### Volumes Persistants
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-pvc
  namespace: formation
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
```

### ConfigMap pour Nginx
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-config
  namespace: formation
data:
  nginx.conf: |
    server {
        listen 80;
        location / {
            return 200 'Formation Tahiti 2024!';
            add_header Content-Type text/plain;
        }
    }
```

### Secrets Sécurisés
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysql-secret
  namespace: formation
type: Opaque
data:
  mysql-root-password: <base64-encoded-password>
  mysql-password: <base64-encoded-password>
```

## 📊 Monitoring et Debug

### Commandes de Diagnostic
```bash
# État des pods
kubectl get pods -n formation -o wide

# Logs détaillés
kubectl logs -f deployment/mysql -n formation

# Description d'une ressource
kubectl describe pod <pod-name> -n formation

# Événements du namespace
kubectl get events -n formation --sort-by='.lastTimestamp'

# Exécution dans un conteneur
kubectl exec -it <pod-name> -n formation -- /bin/bash
```

### Health Checks
```yaml
# Liveness Probe
livenessProbe:
  httpGet:
    path: /health
    port: 8080
  initialDelaySeconds: 30
  periodSeconds: 10

# Readiness Probe
readinessProbe:
  httpGet:
    path: /ready
    port: 8080
  initialDelaySeconds: 5
  periodSeconds: 5
```

## 🛡️ Sécurité et Bonnes Pratiques

### Docker
1. **Images officielles** comme base
2. **Multi-stage builds** pour réduire la taille
3. **Utilisateur non-root** dans les conteneurs
4. **Scan de sécurité** des images
5. **Variables d'environnement** pour la configuration

### Kubernetes
1. **RBAC** pour l'autorisation
2. **Network Policies** pour l'isolation réseau
3. **Pod Security Standards**
4. **Resource Limits** pour éviter les fuites
5. **Secrets** chiffrés au repos

### Exemple de Security Context
```yaml
securityContext:
  runAsNonRoot: true
  runAsUser: 1001
  fsGroup: 1001
  capabilities:
    drop:
      - ALL
  readOnlyRootFilesystem: true
```

## 📈 Scalabilité

### Horizontal Pod Autoscaler
```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: nginx-hpa
  namespace: formation
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: nginx
  minReplicas: 2
  maxReplicas: 10
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 70
```

## 🎓 Exercices Complémentaires

1. **Multi-container Pods** : Pod avec sidecar pour logs
2. **Init Containers** : Initialisation de la base de données
3. **StatefulSets** : Déploiement ordonné de MySQL
4. **Ingress** : Routage HTTP intelligent
5. **Helm Charts** : Packaging d'applications

## 📚 Ressources Pédagogiques

- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [Kubernetes Concepts](https://kubernetes.io/docs/concepts/)
- [12-Factor App](https://12factor.net/)
- [CNCF Landscape](https://landscape.cncf.io/)
