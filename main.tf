provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "wordpress" {
  ami           = "ami-0015b9ef68c77328d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-002cdc8cdfaf836b9"]
  user_data = file("script.sh")
  key_name = "linux"
  tags = { 
    Name = "wordpress"
  }
}
resource "aws_db_instance" "default" {
  identifier           = "sample"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "wordpress"
  username             = "root"
  password             = "root"
  publicly_accessible  = true
  skip_final_snapshot  = true
} 
