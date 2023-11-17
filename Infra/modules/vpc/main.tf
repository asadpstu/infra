# Create a VPC
resource "aws_vpc" "moribus_stg_vpc" {
  cidr_block = "10.0.0.0/20"
  tags = {
    Name = "moribus-${local.env}-vpc"
  }
  tags_all = {
    Name = "moribus-${local.env}-vpc"
  }

}

# ap-northeast-1a
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.moribus_stg_vpc.id
  cidr_block              = "10.0.0.0/22"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "moribus-${local.env}-public-subnet-a"
  }
  tags_all = {
    Name = "moribus-${local.env}-public-subnet-a"
  }
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id                  = aws_vpc.moribus_stg_vpc.id
  cidr_block              = "10.0.8.0/22"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "moribus-${local.env}-private-subnet-a"
  }
  tags_all = {
    Name = "moribus-${local.env}-private-subnet-a"
  }
}

# ap-northeast-1c
resource "aws_subnet" "public_subnet_c" {
  vpc_id                  = aws_vpc.moribus_stg_vpc.id
  cidr_block              = "10.0.4.0/22"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "moribus-${local.env}-public-subnet-c"
  }
  tags_all = {
    Name = "moribus-${local.env}-public-subnet-c"
  }
}

resource "aws_subnet" "private_subnet_c" {
  vpc_id                  = aws_vpc.moribus_stg_vpc.id
  cidr_block              = "10.0.12.0/22"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = false
  tags = {
    Name = "moribus-${local.env}-private-subnet-c"
  }
  tags_all = {
    Name = "moribus-${local.env}-private-subnet-c"
  }
}

# igw
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.moribus_stg_vpc.id
  tags = {
    Name = "moribus-${local.env}-igw"
  }
  tags_all = {
    Name = "moribus-${local.env}-igw"
  }
}
