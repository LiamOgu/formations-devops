# Création d'une IP publique (Elastic IP) dans AWS pour l'instance EC2
resource "aws_eip" "tp-terraform-eip" {
  domain = "vpc"
  
  tags = {
    Name = "tp-terraform-eip"
  }
}

# Association de l'EIP à l'instance EC2
resource "aws_eip_association" "tp-terraform-eip-assoc" {
  instance_id   = aws_instance.tp-terraform-ec2.id
  allocation_id = aws_eip.tp-terraform-eip.id
}