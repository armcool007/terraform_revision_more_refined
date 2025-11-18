provider "aws" {
	region="ap-south-1"
}
data "aws_availability_zones" "one" {
	state="available"
}
output "list" {
	value=data.aws_availability_zones.one.names
}
