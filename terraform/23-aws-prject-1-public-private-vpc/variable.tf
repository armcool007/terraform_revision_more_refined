variable "amiid" {
	default="ami-03695d52f0d883f65"
}
variable "key" {
	default="ubuntu"
}
variable "instancetype" {
	default="t2.nano"
}
variable "vpc" {
	default="10.0.0.0/16"
}
variable "public_subnet" {
    default="10.0.1.0/24"
}
variable "private_subnet" {
    default="10.0.2.0/24"
}
data "aws_availability_zones" "all" {}

