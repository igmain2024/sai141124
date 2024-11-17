resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "maingatewayIG1711"
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "route table IG1711"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet_1.id
  #count = 2
  route_table_id = aws_route_table.example.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet_2.id
  #count = 2
  route_table_id = aws_route_table.example.id
}