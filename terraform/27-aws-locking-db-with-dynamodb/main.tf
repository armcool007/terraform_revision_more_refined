provider "aws" {
	region="ap-south-1"
}
resource "aws_s3_bucket" "create-buk" {
	bucket="uniquenameofthebucket"
}
resource "aws_dynamodb_table" "table" {
	name="dynamodb"
	hash_key="checkid"
	read_capacity=20
	write_capacity=20
	attribute {
		name="checkid"
		type="S"
	}
	tags={
		Name="dynamoDB"
	}
}
