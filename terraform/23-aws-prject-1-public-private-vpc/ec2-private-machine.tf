resource "aws_instance" "private" {
	ami=var.amiid
  instance_type=var.instancetype
  key_name=var.key
	vpc_security_group_ids=[aws_security_group.pub-pri-sg.id]
	subnet_id=aws_subnet.privatesubnet.id
	availability_zone=data.aws_availability_zones.all.names[1]
	associate_public_ip_address=false
  tags={
    Name="private"
  }

}
