# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_route_table_association.rtbassoc-0b44c68881df61a18:
resource "aws_route_table_association" "rtbassoc-0b44c68881df61a18" {
  route_table_id = aws_route_table.rtb-0329e787bbafcb2c4.id
  subnet_id      = aws_subnet.subnet-i1.id
}
output "rtb-isol" {
  value = aws_route_table.rtb-0329e787bbafcb2c4.id
}