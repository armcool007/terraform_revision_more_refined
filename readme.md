# Filter block SUPPORT and NOT
- EC2/Networking/Infra resources (**VPC, Subnet, SG, Instance, Volume**) → mostly filter { name = "..." value = "..." } style **SUPPORT**.
- IAM/Identity resources (Users, Roles, Groups, Policies) → name_regex / path_prefix style, koi generic filter block **nahi SUPPORT krta**.

# aws ec2 describe-instances help
- Isme "**Filters**" section mein saare valid filter names table format mein milte hain — kyunki Terraform ka filter block seedha isi API ko call karta hai.

# aws describe-instances filters
- Google karein: "aws describe-instances filters" → aapko yeh page milega:
👉 AWS EC2 API Reference → DescribeInstances → Filters

# toset() function Terraform mein ek list (ya kisi bhi collection) ko set type mein convert karta hai.
Yeh kya karta hai
## for_each = toset(var.username_list)
Agar var.username_list ek list of strings hai jaise:
username_list = ["alice", "bob", "charlie"]
toh toset() isse ek set mein convert kar deta hai:
["alice", "bob", "charlie"] → {"alice", "bob", "charlie"}
Iski zaroorat kyun padti hai
for_each meta-argument sirf map ya set of strings accept karta hai — plain list nahi leta (list index-based hoti hai, jo for_each ke saath issues create karti hai).
Isliye jab tumhare paas list hoti hai, usko toset() se set banana padta hai taaki for_each use kar sake.
each.value kya hota hai
Set ke case mein, set ke elements khud unique honay chahiye (koi duplicate index nahi hota jaise list mein), isliye:

each.key = element ki value hi hoti hai
each.value = element ki value hi hoti hai

(Set mein key aur value dono same hote hain kyunki set unordered unique values ka collection hota hai)
