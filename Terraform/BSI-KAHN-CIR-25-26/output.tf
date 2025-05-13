# Outputs pour les ressources Azure

# Resource Group
output "resource_group_name" {
  description = "Nom du Resource Group Azure"
  value       = azurerm_resource_group.limayrac.name
}

output "resource_group_location" {
  description = "Localisation du Resource Group"
  value       = azurerm_resource_group.limayrac.location
}

# Réseau
output "virtual_network_name" {
  description = "Nom du réseau virtuel"
  value       = azurerm_virtual_network.limayrac.name
}

output "virtual_network_id" {
  description = "ID du réseau virtuel"
  value       = azurerm_virtual_network.limayrac.id
}

output "subnet_ids" {
  description = "IDs des sous-réseaux"
  value       = azurerm_subnet.limayrac.*.id
}

# Machine Virtuelle
output "vm_name" {
  description = "Nom de la machine virtuelle"
  value       = azurerm_linux_virtual_machine.limayrac.name
}

output "vm_id" {
  description = "ID de la machine virtuelle"
  value       = azurerm_linux_virtual_machine.limayrac.id
}

output "vm_public_ip" {
  description = "Adresse IP publique de la VM"
  value       = azurerm_public_ip.limayrac.ip_address
}

output "vm_admin_username" {
  description = "Nom d'utilisateur administrateur de la VM"
  value       = azurerm_linux_virtual_machine.limayrac.admin_username
}

# Sécurité
output "network_security_group_id" {
  description = "ID du groupe de sécurité réseau"
  value       = azurerm_network_security_group.limayrac.id
}

# Commandes d'accès
output "ssh_connection_command" {
  description = "Commande pour se connecter en SSH à la machine virtuelle"
  value       = "ssh ${azurerm_linux_virtual_machine.limayrac.admin_username}@${azurerm_public_ip.limayrac.ip_address}"
}

# Application
output "application_url" {
  description = "URL de l'application déployée"
  value       = "http://${azurerm_public_ip.limayrac.ip_address}"
}

# Coûts
output "resource_group_id" {
  description = "ID du Resource Group pour le suivi des coûts"
  value       = azurerm_resource_group.limayrac.id
}
