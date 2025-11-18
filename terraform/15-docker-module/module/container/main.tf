
resource "docker_container" "one" {
	name=var.container_name
	image=var.container_image
}
