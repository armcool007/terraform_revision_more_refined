resource "aws_subnet" "public_subnet_1" {
	vpc_id=aws_vpc.vpc.id
	cidr_block=var.public_subnet_1
	availability_zone=data.aws_availability_zones.all.names[0]
  map_public_ip_on_launch = true
	tags={
		Name="public-subnet-asg-1"
	}
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id=aws_vpc.vpc.id
  cidr_block=var.public_subnet_2
  availability_zone=data.aws_availability_zones.all.names[1]
  map_public_ip_on_launch = true
  tags={
    Name="public-subnet-asg-2"
  }
}

