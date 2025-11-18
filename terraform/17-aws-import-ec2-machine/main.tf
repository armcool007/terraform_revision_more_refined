provider "aws" {
	region="ap-south-1"
}
resource "aws_instance" "one" {
	count=2
	ami="ami-03695d52f0d883f65"
	instance_type="t3.nano"
	tags={
		Name="test"
	}
}
#terraform import aws_instance.one[1] <instance_id>
