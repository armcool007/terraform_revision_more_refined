provider "aws" {
        region="ap-south-1"
}
resource "aws_instance" "one" {
        ami="ami-03695d52f0d883f65"
        instance_type="t3.nano"
        tags={
                Name="testing"
        }
provisioner "local-exec" {
  #command="echo aws_instance.one.private_ip > privateip.txt"
  #   command="echo ${aws_instance.one.private_ip} > privateip.txt"
   command="exit1"  #for failing the provisioner but humko uper wale command "comment" krne hoenge
   on_failure=continue
}
provisioner "local-exec" {
  when=destroy
  command="rm -rf privateip.txt"
}
}
#agr hum "echo aws_instance.one.private_ip > privateip.txt" use krte hain then yahi file me save hota hai.
