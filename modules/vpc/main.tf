# create vpc
resource "aws_vpc" "var.project_name" {
  cidr_block              = var.vpc_cidr
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    
    Name    = "${var.project_name}-vpc"
  }
}

# create internet gateway and attach it to vpc
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.var.project_name.id

  tags      = {
    Name    = "${var.project_name}-igw"
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# create public subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.var.project_name.id
  cidr_block              = var.public_subnet_1_az_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags      = { 
    Name    = "Public Subnet 1"
  }
}

# create public subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.var.project_name.id
  cidr_block              = var.public_subnet_2_az_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags      = { 
    Name    = "Public Subnet 2"
  }
}

# create private app subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.var.project_name.id
  cidr_block              = var.private_subnet_1_az_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags      = { 
    Name    = "Private Subnet 1"
  }
}

# create private app subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.var.project_name.id
  cidr_block              = var.private_subnet_2_az_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags      = { 
    Name    = "Private Subnet 2"
  }
}

# create private database subnet 1
resource "aws_subnet" "private_database_subnet_az_1" {
  vpc_id                   = aws_vpc.var.project_name.id
  cidr_block               = var.private_database_subnet_az_1_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "My database subnet 1"
  }
}

# create private database subnet 2
resource "aws_subnet" "private_database_subnet_az_2" {
  vpc_id                   = aws_vpc.project_name.id
  cidr_block               = var.private_database_subnet_az_2_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "My database subnet 2"
  }
}


# create public route table and attach igw
resource "aws_route_table" "public_route_table" {
  vpc_id       = aws_vpc.project_name.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags       = {
    Name     = "Public Route Table with IGW"
  }
}

# associate public subnet 1 to "public route table"
resource "aws_route_table_association" "public_subnet_1_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_1.id
  route_table_id      = aws_route_table.public_route_table.id
}

# associate public subnet 2 to "public route table"
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_2.id
  route_table_id      = aws_route_table.public_route_table.id
}











