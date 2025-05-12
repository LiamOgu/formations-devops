# 🐉 **Quête : Création d'une Machine Virtuelle sur AWS**

## 📜 **Introduction**

Bienvenue, aventurier ! Vous êtes sur le point d'entreprendre une quête épique dans le royaume du Cloud. Votre mission, si vous l'acceptez, est de déployer une machine virtuelle sur AWS en utilisant les puissants artefacts que sont **Terraform** et **AWS CLI**. Préparez vos outils, configurez vos sorts, et partez à l'aventure !

---

## 🧙‍♂️ **Prérequis**

Avant de vous lancer dans cette quête, assurez-vous d'avoir en votre possession les artefacts suivants :

- **AWS CLI** : L'amulette qui vous permet de communiquer avec les dieux du Cloud.
- **Terraform** : Le grimoire magique pour invoquer et gérer vos ressources.

---

## 🏰 **Étape 1 : Préparation des Credentials**

Pour accéder au royaume d'AWS, vous devez obtenir une **clé magique** (credentials). Voici les étapes pour les obtenir :

1. Créez un utilisateur dans la console AWS avec les permissions nécessaires pour invoquer les ressources.
2. Téléchargez les **clés d'accès** (Access Key ID et Secret Access Key).
3. Configurez votre artefact AWS CLI avec la commande suivante :

   ```bash
   aws configure
   ```

   Fournissez les informations suivantes :
   - **Access Key ID** : Votre clé magique.
   - **Secret Access Key** : Votre mot de passe secret.
   - **Region** : La région où vous souhaitez déployer vos ressources (ex. `us-east-1`).

---

## ⚔️ **Étape 2 : Invocation des Ressources**

### 📖 **Le Grimoire Terraform**

Le grimoire Terraform contient les incantations nécessaires pour invoquer les ressources suivantes :
- **VPC** : Le royaume où résidera votre machine virtuelle.
- **Elastic IP** : Une adresse magique pour accéder à votre machine.
- **Security Groups** : Les boucliers protégeant votre royaume.
- **Key Pair** : La clé pour ouvrir les portes de votre machine.
- **Instance EC2** : Votre fidèle serviteur dans le Cloud.

### 🪄 **Commandes Magiques**

1. **Initialisation du Grimoire** :
   ```bash
   terraform init
   ```

2. **Planification de l'Invocation** :
   ```bash
   terraform plan
   ```

3. **Exécution de l'Invocation** :
   ```bash
   terraform apply
   ```

4. **Destruction des Ressources (si nécessaire)** :
   ```bash
   terraform destroy
   ```

---

## 🛡️ **Étape 3 : Configuration de la Machine**

Une fois votre machine invoquée, elle exécutera un script magique (`user_data`) pour installer et configurer les services nécessaires. Par défaut, elle déploiera un serveur web Apache avec une page d'accueil personnalisée.

---

## 🗺️ **Ressources Déployées**

Voici les artefacts que vous invoquerez lors de cette quête :

- **VPC** : Un royaume isolé pour vos ressources.
- **Elastic IP** : Une adresse publique pour accéder à votre machine.
- **Security Groups** : Des règles pour autoriser ou bloquer le trafic.
- **Key Pair** : Une clé SSH pour sécuriser l'accès.
- **Instance EC2** : Une machine virtuelle pour héberger vos applications.

---

## 🧝‍♀️ **Sorts Utiles**

### **Commande SSH pour se connecter à votre machine :**
```bash
ssh -i tp-terraform-ipi.pem ec2-user@<votre-ip-publique>
```

### **URL de l'application web :**
```
http://<votre-ip-publique>
```

---

## 🏆 **Récompenses**

À la fin de cette quête, vous aurez :
- Une infrastructure AWS entièrement fonctionnelle.
- Une compréhension approfondie de Terraform et AWS.
- Une page web déployée sur votre instance EC2.

---

## 🐲 **Attention aux Pièges !**

- **Permissions IAM** : Assurez-vous que votre utilisateur AWS dispose des permissions nécessaires.
- **Groupes de Sécurité** : Ouvrez les ports 22 (SSH) et 80 (HTTP) pour accéder à votre machine.
- **Région AWS** : Vérifiez que vos ressources sont déployées dans la bonne région.

---

## 📚 **Ressources Supplémentaires**

- [Documentation Terraform](https://www.terraform.io/docs)
- [Documentation AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
- [Guide des Instances EC2](https://aws.amazon.com/ec2/)

---

## 🎲 **Que les dés soient avec vous !**

Bonne chance, aventurier ! Que votre quête soit couronnée de succès et que vos ressources soient déployées sans erreur. 🐉

