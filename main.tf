#Custom VPC Creation
resource "aws_vpc" "my-lab" {
  cidr_block = "12.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "lab"
  }
}

#AZ 1 Public Subnet creation that connects to VPC = NewLab
resource "aws_subnet" "my-lab-vpc-subnet-public1-us-east-1a" {
vpc_id = "my-lab"
availability_zone = "us-east-1a"
cidr_block = "12.0.0.0/20"
  tags = {
    Name = "lab"
  }
}

#AZ 2 Private Subnet creation that connects to VPC = NewLab
resource "aws_subnet" "my-lab-vpc-subnet-private1-us-east-1a" {
vpc_id = "my-lab"
availability_zone = "us-east-1a"
cidr_block = "12.0.128.0/20"
  tags = {
    Name = "lab"
  }
}

#AZ 2 Public Subnet creation that connects to VPC = NewLab
resource "aws_subnet" "my-lab-subnet-public2-us-east-1b" {
vpc_id = "my-lab"
availability_zone = "us-east-1b"
cidr_block = "12.0.16.0/20"
  tags = {
    Name = "lab"
  }
}

#Az 2 Private Subnet creation that connects to VPC = NewLab
resource "aws_subnet" "my-lab-subnet-private2-us-east-1b" {
vpc_id = "my-lab"
availability_zone = "us-east-1b"
cidr_block = "12.0.144.0/20"
  tags = {
    Name = "lab"
  }
}

resource "aws_route_table" "my-lab-rtb-public" {
vpc_id = "my-lab"

}

resource "aws_route_table" "my-lab-rtb-private1-us-east-1a" {
vpc_id = "my-lab"


}

resource "aws_route_table" "my-lab-rtb-private2-us-east-1b" {
vpc_id = "my-lab"


}

resource "aws_internet_gateway" "my-lab-igw" {
  vpc_id = "my-lab"
}
