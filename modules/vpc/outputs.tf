output "region" {
value = var.region
}

output "project_name" {
value = var.project_name.id

}

output "vpc_id" {
value = aws_vpc.project_name.id

}

output "public_subnet_1_id" {
value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1_id" {
value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
value = aws_subnet.private_subnet_2.id
}

output "private_database_subnet_1_id" {
value = aws_subnet.private_database_subnet_az_1.id
}

output "private_database_subnet_2_id" {
value = aws_subnet.private_database_subnet_az_2.id
}

output "internet gateway" {
value = aws_internet_gateway.internet_gateway
}

output "application load balancer" {
value = aws_lb.test
}