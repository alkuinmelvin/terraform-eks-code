# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_internet_gateway.igw-02c295b01d50c9d3e:
resource "aws_internet_gateway" "igw-02c295b01d50c9d3e" {
  tags = {
    "Name" = "igw-eks-cicd"
  }
  vpc_id = aws_vpc.vpc-cicd.id
}
