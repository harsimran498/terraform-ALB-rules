resource "aws_alb" "my-alb" {
 name = "my-alb"
 subnets = ["${aws_subnet.main-public-1.id}","${aws_subnet.main-public-2.id}"]
 security_groups = ["${aws_security_group.elb-securitygroup.id}"]
}

resource "aws_alb_listener" "listener-1" {
 load_balancer_arn = "${aws_alb.my-alb.arn}"
 port = "80"
 
default_action{
   type = "forward"
   target_group_arn = "${aws_alb_target_group.target-group-1.arn}"
 }
}
