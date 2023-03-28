variable "region" {
  type        = string
  default     = "us-west-1"
  description = "enter the region to create resource"
}
variable "vpc_subnet" {
  type        = string
  default     = "10.100.0.0/16"
  description = "enter the vpc cidr range"
}
variable "Subnets" {
  type        = list(string)
  default     = ["10.100.0.0/24", "10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24", "10.100.4.0/24", "10.100.5.0/24"]
  description = "enter the subnet range"
}
variable "subnet_names" {
  type    = list(string)
  default = ["subnet1", "subnet2", "subnet3", "subnet4", "subnet5", "subnet6"]

}
