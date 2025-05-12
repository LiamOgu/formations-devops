# Alternatively, generate a new key pair with Terraform
resource "tls_private_key" "this" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
    key_name   = "generated-key-pair"
    public_key = tls_private_key.this.public_key_openssh
}

# Save the private key locally
resource "local_file" "private_key" {
    content         = tls_private_key.this.private_key_pem
    filename        = "${path.module}/tp-terraform-ipi.pem"
    file_permission = "0600"
}
