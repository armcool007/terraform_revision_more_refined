resource "aws_lb_target_group" "asg_tg" {
	name="ASG-TG"
	target_type="instance"
	protocol="HTTP"
	port="80"
	vpc_id=aws_vpc.vpc.id
	health_check {
		protocol="HTTP"
		path="/index.html"
		healthy_threshold=3
		unhealthy_threshold=2
		interval=300
		matcher="200"
	}

}
