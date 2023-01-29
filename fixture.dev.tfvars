enabled = true

region = "us-east-2"

namespace = "automation"

stage = "dev"

name = "ec2-instance-dev"

ssh_key_pair = "leon-ec2-dev"

azs = ["us-east-2a", "us-east-2b"]

assign_eip_address = false

associate_public_ip_address = true

instance_type = "t2.micro"

ipv4_primary_cidr_block = "10.0.0.0/16"

ipv4_additional_cidr_block_associations = {
  "10.1.0.0/16" = {
    ipv4_cidr_block     = "10.1.0.0/16"
    ipv4_ipam_pool_id   = null
    ipv4_netmask_length = null
  }
}
security_group_rules = [
  {
    type        = "egress"
    from_port   = 0
    to_port     = 65535
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    type        = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["76.218.109.191/32"]
  },
  {
    type        = "ingress"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["76.218.109.191/32", 
    "192.30.252.0/22",
    "185.199.108.0/22",
    "140.82.112.0/20",
    "143.55.64.0/20",]
  },
  {
    type        = "ingress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["76.218.109.191/32"]
  },
]

//IAM
use_fullname = false

principals = {
  "Service" : ["ec2.amazonaws.com"]
}

iam_role_name = "ec2-full-access-dev"

instance_profile_name = "ec2_instance_profile_dev"