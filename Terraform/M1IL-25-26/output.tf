# Informations sur l'instance EC2
output "instance_id" {
  description = "ID de l'instance EC2"
  value       = aws_instance.tp-terraform-ec2.id
}

output "instance_public_ip" {
  description = "IP publique de l'instance EC2"
  value       = aws_instance.tp-terraform-ec2.public_ip
}

# Information sur l'IP élastique (si utilisée)
output "elastic_ip" {
  description = "Adresse IP élastique associée à l'instance"
  value       = aws_eip.tp-terraform-eip.public_ip
}

# Informations sur la clé SSH
output "key_pair_name" {
  description = "Nom de la paire de clés utilisée"
  value       = aws_key_pair.generated_key.key_name
}

output "private_key_path" {
  description = "Chemin local vers le fichier de la clé privée"
  value       = local_file.private_key.filename
}

# Informations sur le réseau
output "vpc_id" {
  description = "ID du VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs des sous-réseaux publics"
  value       = module.vpc.public_subnets
}

# Informations sur la sécurité
output "security_group_id" {
  description = "ID du groupe de sécurité"
  value       = aws_security_group.tp-terraform-ec2-allow_tls_ssh.id
}

# Commande SSH pour se connecter
output "ssh_connection_command" {
  description = "Commande pour se connecter en SSH à l'instance"
  value       = "ssh -i ${local_file.private_key.filename} ec2-user@${aws_eip.tp-terraform-eip.public_ip}"
}

# URL de l'application web
output "application_url" {
  description = "URL de l'application web déployée"
  value       = "http://${aws_eip.tp-terraform-eip.public_ip}"
}