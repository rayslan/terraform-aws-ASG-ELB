
resource "aws_instance" "ec2-1" {
  ami = "ami-0101734ab73bd9e15"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.sec.id]
  key_name = "tmstore"
  subnet_id = module.rus-vpc.public-subnet3-info.id 
  associate_public_ip_address = true
}

