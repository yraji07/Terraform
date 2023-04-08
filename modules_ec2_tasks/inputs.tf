variable "region" {
  type    = string
  default = "us-west-1"
}

variable "cidr_block" {
  type        = list(string)
  default     = ["192.168.0.0/24", "192.168.1.0/24"]
  description = "range of cidr"
}

variable "subnet_names" {
  type    = list(string)
  default = ["subnet1", "subnet2"]
}
variable "subnet_azs" {
  type    = list(string)
  default = ["b", "c"]
}
