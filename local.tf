/* locals {
  region      = "us-west-2"
  aws_profile = "default"

  #environment information
  environment = "dev"
  owner       = "leon"

  #VPC and subnet information
  azs                     = ["us-west-2a", "us-west-2b"]
  public_subnets         = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets          = ["10.0.101.0/24", "10.0.102.0/24"]
  vpc_name                = "dev-vpc"
  cidr                    = "10.0.0.0/16"
  public_subnets_tag_name = "api-vpc-public-us-west-2"

  #SG related information
  https_ingress_cidr = ["0.0.0.0/0"]
  https_ingress_cidr_string = "0.0.0.0/0"         # please be noted string is required for ingress_with_cidr_blocks but list for ingress_cidr_blocks
  ssh_ingress_cidr   = ["76.218.109.191/32"]
  ssh_ingress_cidr_string   = "76.218.109.191/32" # multiple cidr follow this format "0.0.0.0/0,2.2.2.2/32"

  #server ec2 configuration, jumphost type is hard coded as t2.micro
  web_server_instance_type = "t3.xlarge"  #us-west-2 has NO t2
  db_server_instance_type  = "t3.micro"
  root_volume_size         = 10  #GB of server root disk
  jumphost_volume_size     = 10  #GB of 2nd volume for jumphost
  web_volume_size          = 10  #GB of 2nd volume for web server
  db_volume_size           = 10 #GB of 2nd volume for db server
  ssh_key_name             = "leon-ec2"

  # ec2 user data
  user_data_web = <<EOF
#!/bin/bash
echo "Hello Terraform!"
EOF

  user_data_db = <<EOF
#!/bin/bash
echo "Hello Terraform!"
EOF

}
*/