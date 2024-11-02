data "aws_subnet" "selected_subnet"{
  id = "subnet-0596ece886ea42f19"
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "name"
    values = ["al202*-ami-202*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.selected_subnet.id

  tags = {
    Name = var.server_name
  }
}
