resource "aws_internet_gateway" "igw" {
	tags={
		Name="ASG-igw"
	}
	vpc_id=aws_vpc.vpc.id
}

