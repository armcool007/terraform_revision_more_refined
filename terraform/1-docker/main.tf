provider "docker" {
	host="unix:///var/run/docker.sock"
}
resource "docker_image" "example1" {
	name="centos:7"
}
