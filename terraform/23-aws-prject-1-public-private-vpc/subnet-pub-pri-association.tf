resource "aws_route_table_association" "public-rt-association" {
	subnet_id=aws_subnet.public_subnet.id
	route_table_id=aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private-rt-association" {
  subnet_id=aws_subnet.privatesubnet.id
  route_table_id=aws_route_table.private-route.id
}
