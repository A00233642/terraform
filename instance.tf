#variable "aws_region" {
#  type    = string
#  default = "us-east-1"
#}

#ariable "instance_type" {
# type    = string
# default = "t2.medium"
#}

#data "aws_ami" "amazon-2" {
#aws_ami data
#most_recent = true
#filter {
#name   = "description"
#values = [" "]


#}

#owners = ["amazon"]
#}


#resource "aws_instance" "first_ec2" {
#to het latest ami
# ami           = data.aws_ami.amazon-2.id
# instance_type = "t2.micro"
# tags = {
#  name = "Akintunde"

#}


#iam_instance_profile = aws_iam_instance_profile.test_profile.name

#}

#creating a new instance and accessing the session manager
resource "aws_instance" "second-ec2" {
  ami                  = "ami-02396cdd13e9a1257"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.test_profile.name

  tags = {
    "name" = "instance1"
  }

}