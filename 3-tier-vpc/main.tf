# configure aws provider
provider "aws" {
  region  = var.region
  profile = "drayerh1"
}

# create vpc
module "vpc" {
  source                            = "../modules/vpc"
  region                            = var.region
  project_name                      = var.project_name
  vpc_cidr                          = var.vpc_cidr
  public_subnet_1_az_cidr           = var.public_subnet_1_az_cidr
  public_subnet_2_az_cidr           = var.public_subnet_2_az_cidr
  private_subnet_1_az_cidr          = var.private_subnet_1_az_cidr
  private_subnet_2_az_cidr          = var.private_subnet_2_az_cidr
  private_database_subnet_az_1_cidr = var.private_database_subnet_az_1_cidr
  private_database_subnet_az_2_cidr = var.private_database_subnet_az_2_cidr

}