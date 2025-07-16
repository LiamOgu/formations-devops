# ☁️ Infrastructure AWS - M1 Ingénierie Logicielle 2025-2026

Projet Terraform pour déployer une infrastructure AWS complète dans le cadre de la formation M1 Ingénierie Logicielle.

## 🏗️ Architecture

### Infrastructure Déployée
- **1 instance EC2** avec configuration automatique
- **1 Elastic IP** pour un accès fixe
- **Security Groups** avec règles HTTP/HTTPS/SSH
- **Key Pair** pour l'authentification SSH
- **Page web de démonstration**

### Région AWS
- **Zone** : eu-west-3 (Paris)
- **Profil AWS** : tp-terraform-ec2-ipi

## 🚀 Prérequis

```bash
# Installation Terraform (macOS)
brew install terraform

# Configuration AWS CLI avec profil spécifique
aws configure --profile tp-terraform-ec2-ipi
```

## 📁 Structure du Projet

```
M1IL-25-26/
├── providers.tf          # Configuration des providers
├── variables.tf          # Variables d'entrée
├── data.tf              # Sources de données AWS
├── 02_eip.tf            # Elastic IP et association
├── 03_security_groups.tf # Groupes de sécurité
├── 04_key_pair.tf       # Clés SSH
├── 10_virtual_machines.tf # Instances EC2
├── output.tf            # Valeurs de sortie
├── bootstrap.sh         # Script d'initialisation
├── index.html           # Page web de démonstration
└── README.MD            # Documentation
```

## 🚀 Déploiement

### Configuration AWS
```bash
# Vérifier la configuration
aws sts get-caller-identity --profile tp-terraform-ec2-ipi

# Test de connectivité
aws ec2 describe-regions --profile tp-terraform-ec2-ipi
```

### Exécution Terraform
```bash
# Initialisation du projet
terraform init

# Validation de la configuration
terraform validate

# Planification des changements
terraform plan

# Application de l'infrastructure
terraform apply

# Affichage des outputs
terraform output

# Destruction (après utilisation)
terraform destroy
```

## 🔧 Ressources Déployées

### Infrastructure Principale
- **Instance EC2** : Machine virtuelle Ubuntu/Amazon Linux
- **Elastic IP** : Adresse IP publique fixe
- **Security Group** : Règles de pare-feu (SSH, HTTP, HTTPS)
- **Key Pair** : Clé SSH générée automatiquement
- **Bootstrap Script** : Configuration automatique du serveur web

### Configuration Réseau
- **Ports ouverts** : 22 (SSH), 80 (HTTP), 443 (HTTPS)
- **Accès SSH** : Via clé privée générée
- **Région** : eu-west-3 (Paris)

## 📊 Variables et Personnalisation

### Variables Principales
```hcl
# Exemple de variables.tf
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "development"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
```

### Outputs Utiles
Après déploiement, les informations suivantes sont affichées :
- **Adresse IP publique** de l'instance
- **Commande SSH** pour se connecter
- **URL du site web** déployé

## 🛡️ Sécurité

### Bonnes Pratiques Implémentées
1. **Clés SSH** générées automatiquement
2. **Security Groups** restrictifs
3. **Profil AWS** dédié à la formation
4. **Tags** pour l'identification des ressources

### Accès à l'Instance
```bash
# Récupération de la clé privée (générée par Terraform)
terraform output -raw private_key > tp-terraform-ipi.pem
chmod 600 tp-terraform-ipi.pem

# Connexion SSH
ssh -i tp-terraform-ipi.pem ubuntu@$(terraform output -raw public_ip)
```

## � Vérification du Déploiement

### Tests de Connectivité
```bash
# Test du serveur web
curl http://$(terraform output -raw public_ip)

# Vérification de l'état des ressources AWS
aws ec2 describe-instances --profile tp-terraform-ec2-ipi \
  --filters "Name=tag:Project,Values=M1IL-Formation"
```

### Monitoring
```bash
# Logs de l'instance (via SSH)
sudo journalctl -u nginx -f

# État des services
sudo systemctl status nginx
```

## 🎓 Objectifs Pédagogiques

### Compétences Développées
1. **Infrastructure as Code** avec Terraform
2. **Gestion des resources AWS** (EC2, VPC, Security Groups)
3. **Automatisation** du déploiement
4. **Sécurisation** des accès SSH
5. **Configuration** de serveurs web

### Exercices Avancés
1. **Modification de l'instance** (type, région)
2. **Ajout de ressources** (Load Balancer, RDS)
3. **Gestion multi-environnements** (dev, staging, prod)
4. **Utilisation de modules** Terraform

## 🔄 Gestion des États

### Backend Local (par défaut)
L'état Terraform est stocké localement dans `terraform.tfstate`

### Backend S3 (optionnel - production)
```hcl
terraform {
  backend "s3" {
    bucket  = "m1il-terraform-state"
    key     = "infrastructure/terraform.tfstate"
    region  = "eu-west-3"
    profile = "tp-terraform-ec2-ipi"
  }
}
```

## � Troubleshooting

### Problèmes Courants
1. **Permissions IAM insuffisantes**
   ```bash
   aws iam get-user --profile tp-terraform-ec2-ipi
   ```

2. **Région incorrecte**
   ```bash
   aws configure get region --profile tp-terraform-ec2-ipi
   ```

3. **Quotas AWS dépassés**
   ```bash
   aws service-quotas get-service-quota --service-code ec2 \
     --quota-code L-1216C47A --profile tp-terraform-ec2-ipi
   ```

## 📚 Ressources

- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/)
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/)
- [AWS CLI Reference](https://docs.aws.amazon.com/cli/)

