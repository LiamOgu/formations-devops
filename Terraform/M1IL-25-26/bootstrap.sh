#!/bin/bash
# Rediriger les logs pour déboguer
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

echo "=== DÉBUT DE L'EXÉCUTION DU SCRIPT ==="
echo "Mise à jour des paquets..."
yum update -y

echo "Installation d'Apache..."
yum install -y httpd

echo "Démarrage du service Apache..."
systemctl start httpd
systemctl enable httpd

echo "Création de la page d'accueil..."
echo '<html><body><h1>Hello from Terraform</h1><p>Installation réussie!</p></body></html>' > /var/www/html/index.html

echo "Redémarrage d'Apache..."
systemctl restart httpd

echo "=== FIN DE L'EXÉCUTION DU SCRIPT ==="
