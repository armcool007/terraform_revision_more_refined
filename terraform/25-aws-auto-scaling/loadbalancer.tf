resource "aws_lb" "alb" {
  name="ASG-LB"
  load_balancer_type="application"
	internal=false
  #	vpc_id=aws_vpc.vpc.id
	security_groups=[aws_security_group.sg.id]  
  subnets=[aws_subnet.public_subnet_1.id,aws_subnet.public_subnet_2.id] #remmember more then 1 subnets should be their
}
#Aur AWS mein Target Group ko Load Balancer se jodne ka ek hi tareeka hai:
#👉 Listener ke through

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg_tg.arn
  }
}
/*
 🎯 Pehle: "Listener" ka basic concept
Listener = ALB ka "karn" (ear) jo sunta hai ki koi traffic aaya hai kya?
Jaise: 

"Kya koi port 80 par website mang raha hai?"
Agar haan, toh kya karna hai? → Forward karna hai target group ko.
Bina listener ke, ALB behra hai — traffic aaye ya na aaye, usse farq nahi padta.

🔍 Ab, line by line samajhte hain:
1. resource "aws_lb_listener" "http" {
Matlab: Hum ek ALB Listener banane wale hain.
"http" = is resource ka Terraform naam (aap kuch bhi rakh sakte hain, jaise web, frontend, etc.)
2. load_balancer_arn = aws_lb.alb.arn
Matlab: Yeh listener kis ALB ke liye hai?
aws_lb.alb.arn = woh ARN (unique ID) jo aapke ALB ka hai.
Kyu? → Taki AWS pata kar sake ki yeh listener ASG-LB ke liye hai, kisi aur ALB ke liye nahi.
3. port = 80
Matlab: Port 80 par traffic sunna hai.
Kyu? → Kyunki web browsers HTTP traffic port 80 par bhejte hain (e.g., http://example.com = port 80).
4. protocol = "HTTP"
Matlab: Hum HTTP protocol expect kar rahe hain (not HTTPS, not TCP).
Kyu? → Kyunki aapka Apache HTTP serve kar raha hai, aur aapne Target Group bhi HTTP define kiya hai.
5. default_action { ... }
Matlab: Agar koi request aaye, toh default tareeke se kya karna hai?
Kyu? → ALB ke paas rules hote hain; default_action woh kaam karta hai jo har request ke liye apply hota hai (jab koi special rule match na ho).
6. type = "forward"
Matlab: Request ko aage bhejo (forward karo) — terminate mat karo.
Kyu? → Kyunki hum chahte hain ki user ka request EC2 instance tak pahunch jaye.
7. target_group_arn = aws_lb_target_group.asg_tg.arn
Matlab: Forward kaha karna hai? → ASG-TG naam ke Target Group ko.
Kyu? → Kyunki wahi group mein aapke EC2 instances register hain.
*/

