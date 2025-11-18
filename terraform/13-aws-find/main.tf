provider "aws" {
	region="ap-south-1"
}
data "aws_instances" "one" {
	filter {
		name="instance-type"
		values=["t3.micro","t3.nano","t3.small"]
	}
  instance_state_names=["stopped"]
}
#output "list" {
#	value=data.aws_instances.one.tags["Name"]
#}
data "aws_instance" "two" {
  for_each=toset(data.aws_instances.one.ids)
  instance_id=each.value
}
output "list" {
  value=[for i in data.aws_instance.two: i.tags["Name"]]
}
#Terraform me data "aws_instances" multiple IDs ke list ko ek saath handle karta hai, lekin individual instance ke details nikalne ke liye data "aws_instance" (singular form) use karna padta hai — not aws_instances.
