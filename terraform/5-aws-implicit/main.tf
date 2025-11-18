provider "aws" {
	region="ap-south-1"
}
resource "aws_instance" "one" {
	ami="ami-03695d52f0d883f65"
	instance_type="t3.nano"
	tags={
		Name="test"
	}
}
resource "aws_eip" "two" {
	instance=aws_instance.one.id
}
