provider "aws" {
  region = "us-east-2"
}
#module "s3" {
#    source = "./s3"
#    org = var.org
##    env = var.env
 #   application = var.application
 #   bucket_acl = var.bucket_acl
#}
#####main_variables_for_rds_setup
variable "storage_size" {}
variable "storage_type" {}
variable "db_engine" {}
variable "engine_version" {}
variable "db_instance_class" {}
variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
variable "db_para_group" {}
variable "db_identifier" {}
variable "aws_name" {}
#variable "db_vpc" {}

######RDS_module
module "rds-postgres" {
    source = "./modules/rds-postgres"
    db_identifier = var.db_identifier
    storage_size = var.storage_size
    storage_type = var.storage_type
    db_engine = var.db_engine
    engine_version = var.engine_version
    db_instance_class = var.db_instance_class
    db_name = var.db_name
    db_user = var.db_user
    db_password = var.db_password
    db_para_group = var.db_para_group
    #db_vpc = data.aws_vpc.demo.id
}

data "aws_vpc" "demo" {
filter {
    name = "tag:Name"
    values = ["${var.aws_name} VPC"]
  }
}

data "aws_subnet_ids" "aws_db_pri_subnet" {
vpc_id = data.aws_vpc.demo.id
}

#resource "aws_db_subnet_group" "default" {
#  name       = "main"
#  subnet_ids = ["${var.aws_name} Private A"]

 # tags = {
 #   Name = "private subnet group"
  #}
#}