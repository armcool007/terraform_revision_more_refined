provider "aws" {
	region="ap-south-1"
}
resource "aws_iam_user" "creation" {
	for_each=toset(var.list_of_users)
	name=each.value
}
