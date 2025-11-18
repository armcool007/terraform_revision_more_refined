resource "aws_security_group" "pub-pri-sg" {
        tags={
                Name="Personal-SG"
}
        vpc_id=aws_vpc.vpc.id
        egress {
                protocol="-1"
                to_port=0
                from_port=0
                cidr_blocks=["0.0.0.0/0"]
        }
        ingress {
                to_port=22
                from_port=22
                protocol="tcp"
                cidr_blocks=["0.0.0.0/0"]
        }
	ingress {
		to_port=8080
                from_port=8080
                protocol="tcp"
                cidr_blocks=["0.0.0.0/0"]

	}
}

