#terraform state file storage in s3
terraform {
  backend "s3" {
    bucket  = "3-tier-vpc-terraform-remote-state"
    key     = "3-tier-vpc.tfstate"
    region  = "eu-west-2"
    profile = "drayerh1"
  }
}