# Filter block SUPPORT and NOT
- EC2/Networking/Infra resources (**VPC, Subnet, SG, Instance, Volume**) → mostly filter { name = "..." value = "..." } style **SUPPORT**.
- IAM/Identity resources (Users, Roles, Groups, Policies) → name_regex / path_prefix style, koi generic filter block **nahi SUPPORT krta**.

# aws ec2 describe-instances help
- Isme "**Filters**" section mein saare valid filter names table format mein milte hain — kyunki Terraform ka filter block seedha isi API ko call karta hai.
