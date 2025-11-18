provider "docker" {
	host="unix:///var/run/docker.sock"
}
resource "docker_image" "one" {
	name="httpd:latest"
}
resource "docker_container" "two" {
	name="container-1"
  image=docker_image.one.name
  ports {
    internal="80"
    external="80"
  }
}
