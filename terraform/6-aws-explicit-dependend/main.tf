provider "aws" {
	region="ap-south-1"
}
resource "aws_instance" "one" {
	ami="ami-03695d52f0d883f65"
	instance_type="t3.nano"
	tags={
		Name="exlicit"
	}
}
resource "aws_s3_bucket" "two" {
	bucket="hardname"
	depends_on=[aws_instance.one]
}
