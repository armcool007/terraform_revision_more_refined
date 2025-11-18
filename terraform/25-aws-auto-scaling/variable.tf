variable "vpc" {
	default="10.0.0.0/16"
}

variable "public_subnet_1" {
	default="10.0.1.0/24"
}
variable "public_subnet_2" {
  default="10.0.2.0/24"
}

variable "amiid" {
	default="ami-03695d52f0d883f65"
}
variable "instancetype" {
	default="t2.nano"
}
variable "keyfilename" {
	default="ubuntu"
}
data "aws_availability_zones" "all" {}
