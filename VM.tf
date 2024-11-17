resource "aws_instance" "web" {
  ami                         = "ami-0866a3c8686eaeeba"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  subnet_id                   = aws_subnet.subnet_1.id
  associate_public_ip_address = true
  depends_on                  = [aws_security_group.allow_tls]
  tags = {
    Name = "VMIG1711"
  }
}

