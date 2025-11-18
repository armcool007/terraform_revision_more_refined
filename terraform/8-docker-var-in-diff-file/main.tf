provider "docker" {
	host="unix:///var/run/docker.sock"
}

resource "docker_image" "one" {
	name=var.image_name
}
resource "docker_container" "two" {
	name=var.container_name
	image=docker_image.one.name
}
