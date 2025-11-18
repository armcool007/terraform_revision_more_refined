resource "aws_instance" "one" {
	ami="ami-0cae6d6fe6048ca2c"
	instance_type="t2.nano"
	provider=aws.virginia
	tags={
		Name="virginia"
	}
}
resource "aws_instance" "two" {
        ami="ami-03695d52f0d883f65"
        instance_type="t2.nano"
        provider=aws.mumbai
        tags={
                Name="mumbai"
        }
}

