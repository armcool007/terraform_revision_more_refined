provider "aws" {
	region="ap-south-1"
}
resource "aws_instance" "one" {
	ami="ami-03695d52f0d883f65"
	instance_type="t3.nano"
	tags={
		Name="testing"
	}
	count=var.create? 1:0
  }
variable "create" {}

/*How it works
#| `var.create` value | Result                              |
| ------------------ | ----------------------------------- |
| `true`             | 1 instance create karega            |
| `false`            | 0 (koi instance create nahi karega) |
*/
