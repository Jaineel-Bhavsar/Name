resource "aws_security_group" "dino_stack_sg" {
	vpc_id = aws_vpc.dino.id
	name = "dino-stack-sg"
	description = "Sec Grp for dino ssh"
	egress {
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = [var.MYIP]
	}
	tags = {
	Name = "allow-ssh"
	}

	ingress {
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = [var.MYIP]
	}
	
}