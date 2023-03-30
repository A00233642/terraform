#variable "aws_region" {
 # type    = string
 # default = "us-east-1"
#}

#variable "instance_type" {
#  type = string
#default = t2.medium 
#}

data "aws_ami" "amazon-2"{
    most_recent = true
    filter {
      name = "description"
      values = ["Amazon Linux 2 Kernel * x86_64 HVM gp2"]
    }

    owners = [ "amazon" ]

}

resource "aws_instance" "first-ec2" {
    #get latest ami
    ami = data.aws_ami.amazon-2.id
    instance_type = "t2.micro"
    tags = {
      "name" = "pragra-totorials"
    }
  
}