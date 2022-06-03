# All public instances use the same security group but have been launched into different subnets
resource "aws_instance" "public1a" {
  ami                    = "ami-0d729d2846a86a9e7"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.public.id}"]
  subnet_id              = data.aws_subnet.public1a.id
  key_name               = aws_key_pair.deployer.key_name
  user_data              = file("./user-data.txt")

  tags = {
    Name = "Public-1A"
  }
}

resource "aws_instance" "public1b" {
  ami                    = "ami-0d729d2846a86a9e7"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.public.id}"]
  subnet_id              = data.aws_subnet.public1b.id
  key_name               = aws_key_pair.deployer.key_name
  user_data              = file("./user-data.txt")

  tags = {
    Name = "Public-1B"
  }
}

# Uses a security group with rule to only allow ingress traffic from the public security group
resource "aws_instance" "private1b" {
  ami                    = "ami-0d729d2846a86a9e7"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.private.id}"]
  subnet_id              = data.aws_subnet.private1b.id
  key_name               = aws_key_pair.deployer.key_name
  user_data              = file("./user-data.txt")

  tags = {
    Name = "Private-1B"
  }
}

output "public1a_ip" {
  value = aws_instance.public1a.public_ip
}

output "public1b_ip" {
  value = aws_instance.public1b.public_ip
}

output "private1b-ip-priv" {
  value = aws_instance.private1b.private_ip
}