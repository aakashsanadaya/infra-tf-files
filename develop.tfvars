env="dev"
aws_region="us-west-2"
aws_name="demo-vpc"

#####_varibale_values_for_rds_dev_env##
storage_size = "20"
storage_type = "gp2"
db_engine = "postgres"
engine_version = "12.4"
db_instance_class = "db.t2.micro"
db_name = "postgres_db"
db_user = "demo"
db_password = "password123"
db_para_group = "default"
db_identifier = "demo-db"
db_vpc = "data.aws_vpc.demo.id"

