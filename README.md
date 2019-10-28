# t-20539
Ticket 20539, modules folder not available in recommended structure

# Initial Synopsis
I've recently upgraded to Terraform 12 (Both client side and in PTFE), I'm using the directory based repo structure:

https://www.terraform.io/docs/cloud/workspaces/repo-structure.html#directories

What I run a Plan or Apply using the remote backend, I get the following error:

```bash
Error: Unreadable module directory

Unable to evaluate directory symlink: lstat ../../../modules: no such file or
directory
```

This is only an issue for Terraform 12.

# Reproducing
