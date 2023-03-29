resource "aws_s3_bucket" "taiwo123" {
  bucket = "io.taiwo.tutorial1"
  tags = {
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "version1" {
  bucket = aws_s3_bucket.taiwo123.id
  versioning_configuration {
    status = "Enabled"
  }

}

data "aws_s3_bucket" "data" {
  bucket = "taiwo-testing123"
}

#data "aws_route53_zone" "test_zone" {
#name         = "taiwo.com"
# private_zone = false
#}

#resource "aws_route53_record" "akin" {
#zone_id = data.aws_route53_zone.test_zone.id
# name    = "bucket"
# type    = "A"


#alias {
#   name                   = aws_elb.main.dns_name
#   zone_id                = aws_elb.main.zone_id
#   evaluate_target_health = true
# }


#}

resource "aws_s3_object" "first_item" {
  bucket = data.aws_s3_bucket.data.id
  key    = "terraform.tf"
  source = "terraform.tf"

}

#resource "aws_elb" "main" {
#name               = "foobar-terraform-elb"
#availability_zones = ["us-east-1c"]

#listener {
#instance_port     = 80
#instance_protocol = "http"
#lb_port           = 80
#lb_protocol       = "http"
#}

#}


