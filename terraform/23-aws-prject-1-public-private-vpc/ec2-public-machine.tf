resource "aws_instance" "public" {
	ami=var.amiid
	instance_type=var.instancetype
	key_name=var.key
	vpc_security_group_ids=[aws_security_group.pub-pri-sg.id]
	subnet_id=aws_subnet.public_subnet.id
	availability_zone=data.aws_availability_zones.all.names[0]
	associate_public_ip_address=true
  tags={
    Name="public"
  }
	user_data=  <<-EOF
	#!/bin/sh
	echo "hi" > /var/www/html/index.html
	nohup busybox httpd -f -p 8080 &
	EOF
}
