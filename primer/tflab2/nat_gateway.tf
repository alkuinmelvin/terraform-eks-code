# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_nat_gateway.nat-070132f292c79b9d6:
resource "aws_nat_gateway" "mynatgw" {
  count         = var.mycount
  allocation_id = aws_eip.my-eip[count.index].id
  subnet_id     = aws_subnet.mypubsubnet[count.index].id
  tags          = {}
}
