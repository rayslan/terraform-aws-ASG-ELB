#----------Launch Template-----------------
resource "aws_launch_template" "lt" {
  name_prefix = "rus-lt" # Add to var
  image_id = "ami-0101734ab73bd9e15" #Add to var
  instance_type = "t2.micro" #Add to var
  vpc_security_group_ids = [aws_security_group.sec.id]


}

#----------Target Group-----------------
resource "aws_lb_target_group" "tg" {
  name = "rus-tg" #Add to var
  port = 80
  vpc_id = module.rus-vpc.vpc-info.id #Add to *Module var*
  protocol = "HTTP" #Add to var
}

#----------Target Group Attachment-----------------
resource "aws_lb_target_group_attachment" "tg-attachment" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id = aws_instance.ec2-1.id
  port = 80
}


#----------Application Load Balancer-----------------
resource "aws_lb" "lb" {
    name = "rus-lb" #Add to var
    load_balancer_type = "application" #Add to var
    internal = false #Add to var
    subnets = [ module.rus-vpc.public-subnet1-info.id, 
                        module.rus-vpc.public-subnet2-info.id, 
                        module.rus-vpc.public-subnet3-info.id] #Add to *Module var*
    security_groups = [ aws_security_group.sec.id ]
      
}

#------------------ASG-----------------
resource "aws_autoscaling_group" "asg" {
  name = "rus-asg" #Add to vars
  vpc_zone_identifier = [ module.rus-vpc.public-subnet1-info.id, 
                        module.rus-vpc.public-subnet2-info.id, 
                        module.rus-vpc.public-subnet3-info.id] # Add to *Module var*



  launch_template {
    id = aws_launch_template.lt.id
    version = "$Latest"
  }

    desired_capacity = 2 #Add to var
  max_size = 3 #Add to var
  min_size = 1 #Add to var

}
#----------ASG Policy-----------------
resource "aws_autoscaling_policy" "cpu" {
  
  autoscaling_group_name = aws_autoscaling_group.asg.name
  name = "track cpu usage" #Add to var
  scaling_adjustment = 4
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
    
}