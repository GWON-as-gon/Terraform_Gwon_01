# ec2.terraform 
resource "aws_key_pair" "ec2_key" {
    key_name = "GwonTerra"
    public_key = file("./Gwon_terra_Pubkey.pub")
}

resource "aws_instance" "gwon_terra_ec2_1" {
  ami="ami-0fa4ce94e29028a93"
   instance_type = "t2.micro"
  vpc_security_group_ids = [ 
    aws_security_group.GwonPrivateSG.id
   ]
  subnet_id = aws_subnet.G1_terraform_Public_Sub.id
  key_name = aws_key_pair.ec2_key.key_name
  root_block_device {
    volume_size = 200
    volume_type = "gp3"

  }
  associate_public_ip_address = true
  tags = {
    Name = "gwon_terra_ec2_1"
  }
}