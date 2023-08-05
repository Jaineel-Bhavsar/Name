variable REGION {
	default = "us-east-1"
}

variable ZONE1 {
	default = "us-east-1a"
}

variable ZONE2 {
	default = "us-east-1b"
}

variable ZONE3 {
	default = "us-east-1c"
}

variable MYIP {
	default = "103.241.226.232/32"
}


variable USER {
	default = "ec2-user"
}

variable AMIS {
	type = map
	default = {
	us-east-1 = "ami-0f34c5ae932e6f0e4"
	us-east-2 = "ami-02a89066c48741345"
	}
}

variable PUB_KEY {
	default = "dinokey.pub"
}

variable PRIV_KEY {
	default = "dinokey"
}