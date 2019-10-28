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


- Folder tree : 
```
.
├── LICENSE
├── README.md
├── main.tf
├── make_dirs.sh
├── modules
│   ├── null
│   │   ├── README.md
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── pet
│       ├── README.md
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
└── variables.tf
```
- Terraform init :
```bash
Initializing modules...
- null in modules/null
- pet in modules/pet

Initializing the backend...

Successfully configured the backend "remote"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "null" (hashicorp/null) 2.1.2...
What I run a Plan or Apply using the remote backend, I get the following error:

# t-20539
The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.null: version = "~> 2.1"

Terraform has been successfully initialized!
```
- Terraform Plan :
```bash
terraform plan
Running plan in the remote backend. Output will stream here. Pressing Ctrl-C
will stop streaming the logs, but will not stop the plan running remotely.

Preparing the remote plan...

To view this run in a browser, visit:
https://app.terraform.io/app/galser-free/t-20539/runs/run-F4apwG5LaenhbbHX

Waiting for the plan to start...

Terraform v0.12.11
Configuring remote state backend...
Initializing Terraform configuration...
2019/10/28 13:43:39 [DEBUG] Using modified User-Agent: Terraform/0.12.11 TFC/623b46863f
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.null.null_resource.null-test will be created
  + resource "null_resource" "null-test" {
      + id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

## Switchin to v 0.12.12

- Version : 
```
terraform -version
Terraform v0.12.12
+ provider.null v2.1.2
```
- Plan : 
```bash
```
