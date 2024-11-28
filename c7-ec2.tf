# Create EC2-Frontend instance in public subnet
resource "aws_instance" "public_instance_fe" { 
  ami           = data.aws_ami.ubuntu.id 
  instance_type = var.instance_type 

  user_data = file("${path.module}/c8-frontend-install.sh")
  key_name = var.instance_keypair
  
  subnet_id = aws_subnet.public_subnet.id  
  vpc_security_group_ids = [ aws_security_group.vpc-web.id   ]

  tags = {
    Name = "FrontEnd-Public-Server"
  }
}