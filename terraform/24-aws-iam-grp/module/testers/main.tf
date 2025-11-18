resource "aws_iam_group" "tester-group" {
	name="tester-group"
}
resource "aws_iam_group_policy" "tester-policy" {
	name="testers-poli"
	group=aws_iam_group.tester-group.name
	policy=file("${path.module}/policy.json")
}
resource "aws_iam_user" "tester_user" {
	for_each=toset(var.usernames)
	name=each.value
}
resource "aws_iam_group_membership" "tester-member" {
	name="tester-mem"
	users=keys(aws_iam_user.tester_user)
	group=aws_iam_group.tester-group.name
}
