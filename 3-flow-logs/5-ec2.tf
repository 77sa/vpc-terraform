resource "aws_instance" "public1" {
  ami                    = "ami-0d729d2846a86a9e7"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
  subnet_id              = aws_subnet.public1.id
  key_name               = aws_key_pair.deployer.key_name
  user_data              = file("./user-data.txt")

  tags = {
    Name = "Public-1"
  }
}

output "public_ip" {
  value = aws_instance.public1.public_ip
}
