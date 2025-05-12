resource "aws_instance" "tp-terraform-ec2" {
  ami           = data.aws_ami.amzn-linux-2023-ami.id
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]

  tags = {
    Name = "tp-terraform-ec2"
  }
}