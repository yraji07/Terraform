provider "aws" {
  region = "us-west-1"
}
# create Rds instance 
resource "aws_db_instance" "myrds" {
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "rajeshwari"
  password             = "Raji!1234"
  allocated_storage    = "10"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  tags = {
    Name = "Myrds_db"
  }
}
