
module "ec2_instance" {
  source = "cloudposse/ec2-instance/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version     = "x.x.x"
  ssh_key_pair                = var.ssh_key_pair
  instance_type               = var.instance_type
  vpc_id                      = module.vpc.vpc_id
  security_group_rules        = var.security_group_rules
  subnet                      = module.subnets.public_subnet_ids[0]
  associate_public_ip_address = var.associate_public_ip_address
  name                        = var.name
  namespace                   = var.namespace
  stage                       = var.stage
  ami                         = data.aws_ami.amazon_linux.image_id
  ami_owner                   = join("", data.aws_ami.amazon_linux.*.owner_id)
  instance_profile            = aws_iam_instance_profile.ec2_profile.name
}