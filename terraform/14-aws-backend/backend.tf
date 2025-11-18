terraform {
backend "s3" {
	bucket="harnamenocrack"
	key="./terraform.tfstate"
	region="ap-south-1"
}
}
