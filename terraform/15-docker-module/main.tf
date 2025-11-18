module "image" {
	source="./module/image"
  #image_name=var.rootmodulevariablefile
}
module "container" {
	source="./module/container"
  container_image=module.image.catch  #ya pe module.image he rahega not the variable name of container haan but container_image variable name of the container rahega.
}
# same agr image aur containername variable k through lena hai then use the "image_name" of the "module/image/variable.tf" me image_name hai toh vo source k neeche lekhenge for dynamically select krne k liye.
