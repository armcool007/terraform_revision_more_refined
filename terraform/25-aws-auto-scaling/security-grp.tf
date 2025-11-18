resource "aws_security_group" "sg" {
	vpc_id=aws_vpc.vpc.id
	egress {
		to_port=0
		from_port=0
		protocol="-1"
		cidr_blocks=["0.0.0.0/0"]
	}
	ingress {
              	to_port=22
                from_port=22
                protocol="tcp"
                cidr_blocks=["0.0.0.0/0"]
	}
	ingress {
                to_port=80
                from_port=80
                protocol="tcp"
                cidr_blocks=["0.0.0.0/0"]
        }

	tags={
        	Name="ASG-SG"
	}

}
