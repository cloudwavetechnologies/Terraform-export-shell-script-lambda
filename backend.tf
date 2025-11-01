terraform {
  backend "s3" {
    bucket         = "statefile-bucket-002"
    key            = "Infra/ec2-creation-terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}