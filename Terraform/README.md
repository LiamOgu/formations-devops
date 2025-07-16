# ☁️ Terraform - Infrastructure as Code

Ce répertoire contient les configurations Terraform pour la gestion de l'infrastructure cloud dans le cadre de différentes formations.

## 📁 Projets

### 🏢 BSI-KAHN-CIR-25-26/
Projet Terraform pour BSI KAHN - Cursus Ingénieur Réseau 2025-2026
- Infrastructure cloud personnalisée
- Configuration multi-environnements
- Déploiement d'applications web

### 🎓 M1IL-25-26/
Infrastructure AWS pour M1 Ingénierie Logicielle 2025-2026
- **Provider AWS** région Paris (eu-west-3)
- **EC2 instances** avec configuration automatique
- **Elastic IP** et adressage réseau
- **Security Groups** et règles de sécurité
- **Key Pairs** pour l'authentification SSH

## 🏗️ Architecture M1IL-25-26

### Composants Infrastructure
```
├── providers.tf          # Configuration des providers AWS
├── variables.tf          # Variables d'entrée
├── data.tf              # Sources de données
├── 02_eip.tf            # Elastic IP
├── 03_security_groups.tf # Groupes de sécurité
├── 04_key_pair.tf       # Clés SSH
├── 10_virtual_machines.tf # Instances EC2
├── output.tf            # Sorties
└── README.MD            # Documentation du projet
```

### Ressources Déployées
1. **Instances EC2** avec bootstrap automatique
2. **Elastic IP** pour adressage fixe
3. **Security Groups** avec règles HTTP/HTTPS/SSH
4. **Key Pairs** pour l'accès sécurisé
5. **Page web** de démonstration

## 🚀 Utilisation

### Prérequis
```bash
# Installation de Terraform
brew install terraform  # macOS
# ou
curl -o terraform.zip https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip

# Configuration AWS CLI
aws configure --profile tp-terraform-ec2-ipi
```

### Déploiement M1IL-25-26
```bash
cd M1IL-25-26/

# Initialisation
terraform init

# Planification
terraform plan

# Application
terraform apply

# Destruction (nettoyage)
terraform destroy
```

### Variables d'Environnement
```bash
# Configuration du profil AWS
export AWS_PROFILE=tp-terraform-ec2-ipi

# Variables Terraform (optionnel)
export TF_VAR_environment=development
export TF_VAR_project_name=m1il-formation
```

## 🔧 Configuration

### Provider AWS
- **Région** : eu-west-3 (Paris)
- **Profil** : tp-terraform-ec2-ipi
- **Version** : ~> 5.0

### Providers Utilisés
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}
```

## 📋 Ressources Types

### Compute
- **aws_instance** : Instances EC2
- **aws_key_pair** : Clés SSH
- **aws_eip** : Elastic IP

### Network
- **aws_security_group** : Groupes de sécurité
- **aws_security_group_rule** : Règles de sécurité

### Storage & Data
- **aws_ami** : Images système
- **local_file** : Fichiers locaux

## 🎯 Objectifs Pédagogiques

### Niveau Débutant
1. **Syntaxe HCL** et structure des fichiers
2. **Providers** et leur configuration
3. **Resources** de base (EC2, Security Groups)
4. **Variables** et paramétrage

### Niveau Intermédiaire
5. **Data sources** et références
6. **Outputs** et informations de sortie
7. **State management** et backend
8. **Modules** et réutilisabilité

### Niveau Avancé
9. **Workspaces** et environnements
10. **Remote state** et collaboration
11. **Import** de ressources existantes
12. **Provisioners** et post-configuration

## 🛡️ Sécurité

### Bonnes Pratiques
1. **Clés SSH** uniques par environnement
2. **Security Groups** restrictifs
3. **IAM roles** avec permissions minimales
4. **Secrets** via AWS Secrets Manager
5. **State** chiffré et sécurisé

### Security Groups Exemple
```hcl
resource "aws_security_group" "web" {
  name = "web-server-sg"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]  # Restreint au réseau interne
  }
}
```

## 📊 Monitoring et Maintenance

### Commandes Utiles
```bash
# État de l'infrastructure
terraform show

# Liste des ressources
terraform state list

# Validation de la configuration
terraform validate

# Formatage du code
terraform fmt

# Documentation
terraform-docs markdown table . > README.md
```

## 📚 Ressources Complémentaires

- [Terraform Documentation](https://registry.terraform.io/)
- [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
