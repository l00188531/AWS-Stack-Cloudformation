# Create EC2-Frontend instance in public subnet
resource "aws_instance" "public_instance_fe" { 
  
  depends_on = [aws_iam_instance_profile.ec2_instance_profile]
  ami           = data.aws_ami.ubuntu.id 
  instance_type = var.instance_type 

  user_data = file("${path.module}/c9-frontend-install.sh")
  key_name = var.instance_keypair
  
  subnet_id = aws_subnet.public_subnet.id  
  vpc_security_group_ids = [ aws_security_group.vpc-web.id   ]

  # Attach IAM Instance Profile
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  tags = {
    Name = "FrontEnd-Public-Server"
  }
}