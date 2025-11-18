provider "aws" {
	region="ap-south-1"
}
resource "aws_instance" "one" {
	ami="ami-03695d52f0d883f65"
	instance_type="t3.nano"
	key_name="ubuntu"
	tags={
		Name="remote"
	}
connection {
	type="ssh"
	host=self.public_ip
	user="ec2-user"
	private_key=file("ubuntu.pem")
}
provisioner "local-exec" {
	command="echo 'while true;do echo 'hi';done'>>script.sh"
}
provisioner "file" {
	source="./script.sh"
	destination="/tmp/script.sh"
}
provisioner "remote-exec" {
	inline = [
		"chmod +x /tmp/script.sh",
		"bash /tmp/script.sh 2>&1 &"
]
#provisioner "remote-exec" me inline ek list of strings hoti hai — na ki key-value commands.
}

}
