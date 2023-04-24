terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

  }

}

#enabling s3 baack end 
terraform {
  backend "s3" {
    bucket         = "mybucket-io"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "tf.bby"
    #profile = "test"


  }



}

#data "aws_dynamodb_table" "tfstates-lock" {

 # name     = "terraform-taiwo"
  #hash_key = "Lockid"
  #attribute {
   # name = "Lockid"
   # type = "s'"
 # }

#}



# Configure the AWS Provider
provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  region = "us-east-1"
  profile                  = "test"
}   