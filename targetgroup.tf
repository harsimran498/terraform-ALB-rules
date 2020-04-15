resource "aws_alb_target_group" "target-group-1" {
 name = "alb-target-group"
 port = 80
 protocol = "HTTP"
 vpc_id = "${aws_vpc.main.id}"
}

resource "aws_alb_target_group" "target-group-2" { 
 name = "alb-target-group2"
 port = 80
 protocol = "HTTP"
 vpc_id = "${aws_vpc.main.id}"
}

/*
resource "aws_alb_target_group_attachment" "target-group-1-attachment" {
 target_group_arn = "${aws_alb_target_group.target-group-1.arn}"
 target_id = "${aws_launch_configuration.example-launchconfig.arn}"
 port = 80
}

resource "aws_alb_target_group_attachment" "target-group-2-attachment" { 
 target_group_arn = "${aws_alb_target_group.target-group-2.arn}"
 target_id = "${aws_launch_configuration.example-launchconfig.arn}"
 port = 80
}
*/
