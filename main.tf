# define provider 
 provider "aws " {
      region= "   "
}
# Create VPC
   resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}

# Creating  Subnet in VPC
resource "aws_subnet"  "my_subnet" {

  vpc_id                  = aws_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"


  tags = {
    Name = "subnet"
  }
}

#define routing table
resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.myvpc.id
    tags = {
    Name ="my_rt"
 
  }
}
# Creating route associations for Subnets
resource "aws_route_table_association" "route" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_rt.id
}

#create security group

resource "aws_security_group" "sg" {
   name = "sg"
   description = " allow inbound traffic "
  vpc_id = "aws_vpc_my_vpc.id
}

# create server instance 
resource "aws_instance" "myapp" {
  ami           = "ami-"
  instance_type = "t2.micro"
  subnet_id = aws_subnet,ny_subnet.id
  security_groups = [aws_security_group_sg.id]
}

#clone project
provisioner "remote-exec" {
  inline = [
   "sudo git clone url"
  ]
}

# create bucket 
resource "aws_s3_bucket" "mybkt1" {
 bucket = "mybkt1"
 region= " "
}



# execution steps - run below commands
# terraform init
#terraform plan
# terraform apply

