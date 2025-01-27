variable "vpc_name" {
  description = "Name of the VPC"
  default     = "mobann-vpc"
  type        = string

}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
  type        = string

}

variable "vpc_azs" {
  description = "Availability Zones for the VPC"
  default     = ["us-east-2a", "us-east-2b"]
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR for the private subnets"
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR for the private subnets"
  default     = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "ec2_instance_ami" {
  description = "AMI for the EC2 instance"
  default     = "ami-0cb91c7de36eed2cb"
  type        = string

}