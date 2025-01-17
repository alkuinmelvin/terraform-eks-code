# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group_rule.sg-0c991999e3313704a-2:
resource "aws_security_group_rule" "mydefsgingress-icmp" {

  cidr_blocks = [
    #for avpc in var.aws_vpc :
    #lookup(var.aws_cidr, avpc)  
    "10.0.0.0/8"
  ]
  from_port         = -1
  ipv6_cidr_blocks  = []
  prefix_list_ids   = []
  protocol          = "icmp"
  security_group_id = data.aws_security_group.defsg.id
  self              = false
  to_port           = -1
  type              = "ingress"
}
