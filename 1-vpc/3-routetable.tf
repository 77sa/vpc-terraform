# Private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  # NAT Gateways sit in a public subnet
  # They are used so that private subnets can access the internet:
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }

  tags = {
    Name = "PRIVATE RT"
  }
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private1b.id
  route_table_id = aws_route_table.private.id
}

# Public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PUBLIC RT"
  }
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public1b.id
  route_table_id = aws_route_table.public.id
}
