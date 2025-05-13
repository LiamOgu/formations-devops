resource "aws_security_group" "tp-terraform-ec2-allow_tls_ssh" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = {
        http = 80
        ssh   = 22
    }

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["MY_IP/32"]
      description = "Allow ${ingress.key} traffic from"
    }
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}