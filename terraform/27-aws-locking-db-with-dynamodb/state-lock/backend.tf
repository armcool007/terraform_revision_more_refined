terraform {
backend "s3" {
	bucket="uniquenameofthebucket"
	key="default/terraform.tfstate" #S3 bucket ke andar default k ander aapka Terraform state file hoga.
	encrypt=true
	region="ap-south-1"
}
}
#bucket ke name se he saara details fetch kr lega jaise "terraform.tfstate" pick kr lega.
#and we can give "uniquenameofthebucket" also without default folder.
