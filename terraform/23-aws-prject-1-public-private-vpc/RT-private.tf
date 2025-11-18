resource "aws_route_table" "private-route" {
	vpc_id=aws_vpc.vpc.id
	route {
		cidr_block="0.0.0.0/0"
		nat_gateway_id=aws_nat_gateway.nat_gw.id
	}
	tags={
		Name="personal-RT-private"
	}
}
