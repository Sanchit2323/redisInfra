resource "aws_lb_target_group" "deploy_tg" {
  name     = "tf-target-group"
  port     = 6379
  protocol = "HTTP"
  vpc_id   = aws_vpc.deploy_vpc.id
}

resource "aws_lb_target_group_attachment" "target_group_attachment_private1" {
  target_group_arn = aws_lb_target_group.deploy_tg.arn
  target_id        = aws_instance.deploy_ec2_private1_instance.id
  port             = 6379
}

resource "aws_lb_target_group_attachment" "target_group_attachment_private2" {
  target_group_arn = aws_lb_target_group.deploy_tg.arn
  target_id        = aws_instance.deploy_ec2_private2_instance.id
  port             = 6379
}