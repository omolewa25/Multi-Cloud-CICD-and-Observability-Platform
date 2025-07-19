

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "example" {
  key_name   = "my-keypair-generated"  # This will show up in AWS EC2
  public_key = tls_private_key.example.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.example.private_key_pem
  filename = "${path.module}/my-keypair-generated.pem"
  file_permission = "0600"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI in your region
  instance_type = "t2.micro"
  key_name      = aws_key_pair.example.key_name

  tags = {
    Name = "MyEC2WithKey"
  }
}