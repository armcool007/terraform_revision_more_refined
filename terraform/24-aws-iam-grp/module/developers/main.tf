resource "aws_iam_group" "group-creation" {
	name="developer-group"
}
resource "aws_iam_group_policy" "policy-creation" {
	name="personal-policy"
	group=aws_iam_group.group-creation.name
	policy=file("${path.module}/policy.json")
}
resource "aws_iam_user" "users-creation" {
	for_each=toset(var.usernames)
	name=each.value
}
resource "aws_iam_group_membership" "joiner" {
	name="joiner-member"
	users=keys(aws_iam_user.users-creation)
	group=aws_iam_group.group-creation.name
}
