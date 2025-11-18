provider "aws" {
	region="ap-south-1"
}
resource "aws_iam_user" "creation" {
  #	name="karma"
  for_each=toset(var.addiamuser)
  name=each.value
}
