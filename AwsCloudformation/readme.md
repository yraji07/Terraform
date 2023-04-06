create a aws terraform cloudformation from resource
main.tf
-------
resource "aws_cloudformation_stack" "network" {
  name          = "networking-stack"
  template_body = file("C:\\Users\\rajiy\\Terraform\\cloud\\activity.json")
  tags = {
    Name = "tfvpccloud"
  }
}
 
provider.tf    (if required change the versions)
----------- 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
  required_version = "> 1.0.0"
}

provider "aws" {
  # Configuration options
  region = "us-west-1"
}

ativity.json file (This file can be anywhere in your system by using this file we can create the cloudformation)
----------------- 
{
    "AWSTemplateFormatVersion": "2010-09-09",
    "Description": "vpccreateincf",
    "Resources": {
        "mycfvpc": {
            "Type": "AWS::EC2::VPC",
            "Properties": {
                "CidrBlock": "192.168.0.0/16",
                "Tags": [
                    {
                        "Key": "Name",
                        "Value": "awscfvpc"
                    }
                ]
            }
        }
    }
}

![preview](imgs/Screenshot%202023-03-31%20183511.png)

![preview](imgs/Screenshot%202023-03-31%20182907.png)

![preview](imgs/Screenshot%202023-03-31%20183249.png)

