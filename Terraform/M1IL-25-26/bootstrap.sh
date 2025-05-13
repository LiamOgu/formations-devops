#!/bin/bash
# Rediriger les logs pour déboguer
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

echo "=== DÉBUT DE L'EXÉCUTION DU SCRIPT ==="
echo "Mise à jour des paquets..."
yum update -y

echo "Installation de Docker..."
yum install -y docker

echo "Démarrage du service Apache..."
systemctl start docker
systemctl enable docker

echo "=== FIN DE L'EXÉCUTION DU SCRIPT ==="
