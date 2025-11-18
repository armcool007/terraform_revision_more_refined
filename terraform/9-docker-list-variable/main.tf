provider "docker" {
	host="unix:///var/run/docker.sock"
}
resource "docker_image" "one" {
  #	name=var.image_name[2]
  name=var.image_name[var.dynamic_image]
}
resource "docker_container" "two" {
  #  name=var.container_name[2]
  name=var.container_name[var.dynamic_name]
	image=docker_image.one.name
}

