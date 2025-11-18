provider "docker" {
	host="unix:///var/run/docker.sock"
}
resource "docker_image" "one" {
	name=var.image_name
}
resource "docker_container" "two" {
	name=var.conatiner_name
  image=docker_image.one.name
}


variable "image_name" {
	default="httpd:latest"
}
variable "conatiner_name" {
	default="different"
}

#terraform apply -var="image_name=nginx" -var="conatiner_name=doc"
