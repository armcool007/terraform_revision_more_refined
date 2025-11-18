resource "aws_eip" "nat-eip" {
	domain="vpc"
	tags={
		Name="personal-EIP"
	}
}
resource "aws_nat_gateway" "nat_gw" {
	allocation_id=aws_eip.nat-eip.id
	subnet_id=aws_subnet.public_subnet.id
	tags={
		Name="personal-nat-gw"
}
}
