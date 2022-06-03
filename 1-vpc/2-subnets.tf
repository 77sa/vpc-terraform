locals {
  azs = ["eu-west-2a", "eu-west-2b"]
}

# Public subnets
# Auto-assign public IPv4 address using map_public_ip_on_launch
resource "aws_subnet" "public1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = local.azs[0]

  map_public_ip_on_launch = true

  tags = {
    Name = "PUBLIC-1A"
  }
}

resource "aws_subnet" "public1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = local.azs[1]

  map_public_ip_on_launch = true

  tags = {
    Name = "PUBLIC-1B"
  }
}

#Private subnets
resource "aws_subnet" "private1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.101.0/24"
  availability_zone = local.azs[0]

  tags = {
    Name = "PRIVATE-1A"
  }
}

resource "aws_subnet" "private1b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.102.0/24"
  availability_zone = local.azs[1]

  tags = {
    Name = "PRIVATE-1B"
  }
}
