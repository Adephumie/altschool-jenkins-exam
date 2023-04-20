resource "aws_subnet" "private-subnet-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private-subnet-1a-cidr
  availability_zone = var.avail_zone_A

  tags = {
    "Name"                            = "private-subnet-1a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

resource "aws_subnet" "private-subnet-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private-subnet-1b-cidr
  availability_zone = var.avail_zone_B

  tags = {
    "Name"                            = "private-subnet-1b"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

resource "aws_subnet" "public-subnet-1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public-subnet-1a-cidr
  availability_zone       = var.avail_zone_A
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-subnet-1a"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "public-subnet-1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public-subnet-1b-cidr
  availability_zone       = var.avail_zone_B
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-subnet-1b"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/demo" = "owned"
  }
}
