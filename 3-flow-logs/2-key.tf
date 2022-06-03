resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = "vpc-flow-logs-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "private_key.pem"
}

resource "null_resource" "chmod" {
  depends_on = [
    local_file.private_key
  ]

  provisioner "local-exec" {
    command = "chmod 400 private_key.pem"
  }
}
