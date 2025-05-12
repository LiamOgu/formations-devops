resource "aws_instance" "tp-terraform-ec2" {
  ami                    = data.aws_ami.amzn-linux-2023-ami.id
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.tp-terraform-ec2-allow_tls_ssh.id]
  key_name               = aws_key_pair.generated_key.key_name
  
  user_data = file("${path.module}/bootstrap.sh")

  tags = {
    Name = "tp-terraform-ec2"
  }
}
