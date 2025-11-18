provider "aws" {
	region="ap-south-1"
	profile="qa"
	alias="mumbai"
}
provider "aws" {
        region="us-east-1"
        profile="qa"
        alias="virginia"
}

