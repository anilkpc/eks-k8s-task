#
# Provider Configuration

provider "aws" {
  region = var.aws-region
}

terraform {
  required_version = "0.14.6"
}

terraform {  
  backend "s3" {    
    bucket = "eks-tf-state-file"    
    key    = "eks/prod/"    
    region = "us-east-1"  
  }
}
