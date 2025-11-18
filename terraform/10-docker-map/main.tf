provider "docker" {
	host="unix:///var/run/docker.sock"
}
resource "docker_image" "one" {
	name=var.image_name["3"]
}
resource "docker_container" "two" {
  name=var.container_name["c2"]
	image=docker_image.one.name
}

