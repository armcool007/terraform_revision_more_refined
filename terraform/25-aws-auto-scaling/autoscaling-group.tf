resource "aws_autoscaling_group" "create_asg" {
	name="ASG"
	launch_template { id=aws_launch_template.asg-launch-template.id }
	target_group_arns=[aws_lb_target_group.asg_tg.arn]
	vpc_zone_identifier=[aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id]
	desired_capacity=2
	min_size=2
	max_size=3
	health_check_type="ELB"
	health_check_grace_period=300
	tag {
		key="Name"
		value="ec2-amazon-linux"
		propagate_at_launch=true
	}
}
