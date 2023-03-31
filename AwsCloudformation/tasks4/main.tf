resource "aws_cloudformation_stack" "network" {
  name          = "networking-stack"
  template_body = file("${path.module}/awscloud.json")
  tags = {
    Name = "tfvpccloud"
  }

}
 