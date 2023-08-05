resource "aws_key_pair" "dino-key" {
	key_name = "dinokey"
	public_key = file(var.PUB_KEY)
}
resource "aws_instance" "dino-web" {
	ami = var.AMIS[var.REGION]
	instance_type = "t2.micro"
	subnet_id = aws_subnet.dino-pub-1.id
	key_name = aws_key_pair.dino-key.key_name
	vpc_security_group_ids = [aws_security_group.dino_stack_sg.id]
	tags = {
	Name = "my-dino"
	}
	provisioner "file" {
	source = "web.sh"
	destination = "/tmp/web.sh"
	}

      provisioner "remote-exec"{
         inline = [
           "chmod u+x /tmp/web.sh",
           "sudo /tmp/web.sh" 
        ]
     }

	connection {
	  user = var.USER
	  private_key = file(var.PRIV_KEY)
	  host = self.public_ip
	}
}

resource "aws_ebs_volume" "vol_4_dino" {
	availability_zone = var.ZONE1
	size = 3
	tags = {
	Name = "extr-vol-4-dino"
	}
}

resource "aws_volume_attachment" "atch_vol_dino" {
	device_name = "/dev/xvdh"
	volume_id = aws_ebs_volume.vol_4_dino.id
	instance_id = aws_instance.dino-web.id
}

output "PublicIP" {
	value = aws_instance.dino-web.public_ip
}