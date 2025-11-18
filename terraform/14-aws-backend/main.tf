provider "aws" {
	region="ap-south-1"
}
resource "aws_s3_bucket" "buck" {
  count=0
  bucket="harnamenocrack"
}
data "aws_instances" "one" {
	filter {
		name="instance-type"
		values=["t3.micro","t3.nano"]
	}
	instance_state_names=["stopped","terminated"]
}
data "aws_instance" "two" {
	for_each=toset(data.aws_instances.one.ids)
	instance_id=each.value
}
output "instance_list" {
	value=[for i in data.aws_instance.two: i.tags["Name"]]
}

