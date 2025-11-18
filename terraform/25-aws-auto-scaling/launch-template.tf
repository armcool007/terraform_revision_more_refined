resource "aws_launch_template" "asg-launch-template" {
	name="ASG-LT"
	image_id=var.amiid
  network_interfaces {
   security_groups=[aws_security_group.sg.id]
  }
	instance_type=var.instancetype
	key_name=var.keyfilename
	user_data=  base64encode(<<-EOF
	#!/bin/bash
	sudo yum install -y httpd
	sudo systemctl enable --now httpd
	echo "this is just checking if the website is working or not" > /var/www/html/index.html
	EOF
  )
}
#security_groups argument top-level mein aws_launch_template resource ke andar allowed nahi hai. 

# Sahi Tareeka: security_groups sirf network_interfaces block ke andar use karna hai
