provider "aws" { region="ap-south-1" }
resource "aws_instance" "machine" {
	ami="ami-03695d52f0d883f65"
	instance_type="t2.nano"
	key_name="ubuntu"
}

