provider "aws" {
	region="ap-south-1"
}
resource "aws_instance" "one" {
	ami="ami-03695d52f0d883f65"
	instance_type="t3.nano"
	key_name="ubuntu"
	provisioner "file" {
		source="./check.txt"
		destination="/tmp/check.txt"
	}

connection {
	type="ssh"
	host=self.public_ip
	user="ec2-user"
	private_key=file("ubuntu.pem")
}
}
