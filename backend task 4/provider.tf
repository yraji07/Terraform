terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
  required_version = "> 1.0.0"
  backend "s3" {
    bucket         = "backendbucket789"
    key            = "backend_task4/main.tf"
    dynamodb_table = "terraformlock1"
    region         = "us-west-1"

  }
}
