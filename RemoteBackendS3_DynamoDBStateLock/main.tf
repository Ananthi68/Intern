terraform {
  backend "s3" {
    bucket         = "my-terraform-remote-state-ananthi1234"  # S3 bucket name
    key = "environments/dev/terraform.tfstate"       # Path to store the state file
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-remote-state-ananthi1234"  # Change to unique name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Training"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = "Training"
  }
}