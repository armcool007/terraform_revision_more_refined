resource "aws_subnet" "privatesubnet" {
	vpc_id=aws_vpc.vpc.id
	cidr_block=var.private_subnet
  availability_zone=data.aws_availability_zones.all.names[1]
	map_public_ip_on_launch=false
	tags={
		Name="private-subnet"
	}
} 
