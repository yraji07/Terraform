resource "aws_cloudformation_stack" "network" {
  name          = "networking-stack"
  template_body = file("C:\\Users\\rajiy\\Terraform\\cloud\\activity.json")
  tags = {
    Name = "tfvpccloud"
  }

}
 