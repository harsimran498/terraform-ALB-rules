resource "aws_alb" "my-alb" {
 name = "my-alb"
 subnets = ["${aws_subnet.main-public-1.id}","${aws_subnet.main-public-2.id}"]
 security_groups = ["${aws_security_group.elb-securitygroup.id}"]
}



resource "aws_alb_listener" "listener" {
  load_balancer_arn = "${aws_alb.my-alb.arn}"
  port              = "80"

 
  default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.target-group-2.arn}"
 } 

}

resource "aws_alb_listener_rule" "listener_rule" {
    listener_arn = "${aws_alb_listener.listener.arn}"


    action {
      type             = "forward"
      target_group_arn = "${aws_alb_target_group.target-group-2.arn}"
    }   

 
    condition {    
     field  = "path-pattern"      
     values = ["/index.html/*"] 
    }

    condition {
    field = "host-header"
    values = ["admin.servermyip.com"]
    } 
    
 }
