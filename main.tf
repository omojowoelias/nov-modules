provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "var.vpc_name"
  cidr = "var.vpc_cidr"

  azs             = var.vpc_azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway     = true
  one_nat_gateway_per_az = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}



module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name  = "ec2-cluster"
  count = 2

  //ami                    = "var.ec2_instance_ami"
  instance_type          = "t3.micro"
  key_name               = "nov24"
  monitoring             = true
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

