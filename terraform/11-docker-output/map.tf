variable "image_name" {
	type=map
  default={
	"1"="httpd:latest"
	"2"="nginx:latest"
	"3"="armcool004/python_splash"
}
}
variable "container_name" {
	type=map
  default={
	"c1"="earth"
	"c2"="mars"
	"c3"="venus"
	"c4"="neptune"
}
}
