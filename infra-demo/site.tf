#base

resource "aws_instance" "demo_instance_1" {
  ami                  = data.aws_ami.ubuntu-image.id
  instance_type        = "t2.micro"
  subnet_id            = data.aws_subnets.public_subnets.ids[0]
  associate_public_ip_address = true
  user_data = file("user_data.sh")
  metadata_options {
    http_tokens = "required"
    http_endpoint = "enabled"
  }

  tags = merge(
    tomap({ "component" = "demo" }),
    tomap({ "Name" = "demo_instance_1" }),
    var.default_tags
  )

}

resource "aws_instance" "demo_instance_2" {
  ami                  = data.aws_ami.ubuntu-image.id
  instance_type        = "t2.micro"
  subnet_id            = data.aws_subnets.public_subnets.ids[0]
  associate_public_ip_address = true
  user_data = file("user_data.sh")
  metadata_options {
    http_tokens = "required"
    http_endpoint = "enabled"
  }

  tags = merge(
    tomap({ "component" = "demo" }),
    tomap({ "Name" = "demo_instance_2" }),
    var.default_tags
  )

}
