data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["VPC"]
  }
}

data "aws_subnet" "public1a" {
  filter {
    name   = "tag:Name"
    values = ["PUBLIC-1A"]
  }
}

data "aws_subnet" "public1b" {
  filter {
    name   = "tag:Name"
    values = ["PUBLIC-1B"]
  }
}

data "aws_subnet" "private1b" {
  filter {
    name   = "tag:Name"
    values = ["PRIVATE-1B"]
  }
}
