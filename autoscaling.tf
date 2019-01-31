# template for EC2 instance. will be used in autoscaling 
resource "aws_launch_configuration" "web-servers" {
  name_prefix = "web-servers"
  image_id = "${var.ami_autoscale}"
  instance_type = "t2.micro"
  key_name = "${var.ssh_keypair}"
  security_groups = ["${aws_security_group.web-servers-autoscaling.id}"]
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
  lifecycle {
      create_before_destroy = true
  }
}
# Autoscaling group properties
resource "aws_autoscaling_group" "webservers-autoscaling" {
  
}

