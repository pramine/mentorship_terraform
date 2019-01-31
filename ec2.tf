resource "aws_instance" "web" {
  ami = "${lookup(var.ami, var.aws_region)}"
  instance_type = "t2.micro"

  # VPC subnet
  subnet_id = "${aws_subnet.public-subnet.id}"

  # Security group
  vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]

  # Public SSK key
  key_name =  "${var.ssh_keypair}"
  
  availability_zone = "${var.aws_region_az_public}"

  tags {
      Name = "web server"
      Description = "frontend server"
  }
  provisioner "file"{
      source = "packages.sh"
      destination = "/tmp/packages.sh"
  }
  provisioner "remote-exec"{
      inline = [
          "chmod +x /tmp/packages.sh" ,
          "sudo /tmp/packages.sh"
      ]
  }
  connection {
      user = "${var.INSTANCE_USERNAME}"
      private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }

}
output "local IP" {
  value = "${aws_instance.web.private_ip}"
}
output "external IP" {
  value = "${aws_instance.web.public_ip}"
}
output "Public DNS" {
  value = "${aws_instance.web.public_dns}"
}
#   private_dns = ip-10-0-1-10.eu-central-1.compute.internal
#   private_ip = 10.0.1.10
#   public_dns = ec2-52-59-225-115.eu-central-1.compute.amazonaws.com
#   public_ip = 52.59.225.115

