terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# AWS Provider Configurateion
provider "aws" {
  region = "us-east-1"
  access_key = "my-key" 
  secret_key = "my-secret-key"
}


#Provisioning S3

  resource "aws_s3_bucket" "my_bucket" {
    bucket = "mybuck123167856888"  
  
    tags = {
      Name        = "buck"
      Environment = "Dev"
    }
  }


  