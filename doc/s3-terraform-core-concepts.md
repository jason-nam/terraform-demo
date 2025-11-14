# <span style="color: lightgreen">Terraform Core Concepts</span>

## <span style="color: lightyellow">Core Concepts</span>

- Providers
- Resources
- HCL Language features
- State management
- Variables and Outputs
- Modules

## <span style="color: lightyellow">Installation</span>

### <span style="color: lightblue">macOS</span>

```macos
brew tap hashicorp/tap

brew install hashicorp/tap/terraform
```

### <span style="color: lightblue">Windows</span>

```macos
choco install terraform
```

## <span style="color: lightyellow">Providers</span>

- A <span style="color: pink">**plugin**</span> used to interact with APIs.

  ```tf
  terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
      }
    }

    provider "aws" {
      region = "us-east-1"
    }
  }
  ```

- Where do they come from? - [<span style="color: pink">***Terraform Registry***</span>](https://registry.terraform.io/providers/hashicorp/local/latest/docs)

### <span style="color: lightblue">Local Provider Demo</span>

Provider tf file code:

```hcl
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

// Local provider does not require any configuration
provider "local" {}
```

Terraform init command in terminal:

```zsh
terraform init
```

Result:

```zsh
Initializing the backend...
Initializing provider plugins...
- Finding hashicorp/local versions matching "2.5.1"...
- Installing hashicorp/local v2.5.1...
- Installed hashicorp/local v2.5.1 (signed by HashiCorp)
Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

## <span style="color: lightyellow">Resources</span>

- Defines the <span style="color: pink">**ACTUAL components**</span> of the infrastructure.
- **Syntax**:

  ```hcl
  resource "type" "local_name" {}
  ```

- **Example**:

  ```hcl
  resource "aws_instance" "web" {
    ami           = "ami-a1b2c3d4"
    instance_type = "t2.micro"
  }
  ```

- [<span style="color: pink">***Terraform Local Resources***</span>](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)

### <span style="color: lightblue">Local Resources Demo</span>

main.tf code file:

```hcl
# simple file resource

resource "local_file" "tf_example_1" {
  # filename = "01_basics/example_1.txt"
  filename = "${path.module}/example_1.txt"
  content = "This is the terraform course"
}
```

Terraform plan:

```zsh
terraform plan
```

Result:

```zsh
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # local_file.tf_example_1 will be created
  + resource "local_file" "tf_example_1" {
      + content              = "This is the terraform course"
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "./example_1.txt"
      + id                   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```

Terraform apply:

```zsh
terraform apply
```

Result:

```zsh
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # local_file.tf_example_1 will be created
  + resource "local_file" "tf_example_1" {
      + content              = "This is the terraform course"
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "./example_1.txt"
      + id                   = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

local_file.tf_example_1: Creating...
local_file.tf_example_1: Creation complete after 0s [id=d762270ca20bceadae61c7e91ea0eed718fbb25c]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

### <span style="color: lightblue">Destroy Local Resource Demo</span>

Terraform destroy command:

```zsh
terraform destroy
```

Result:

```zsh
local_file.tf_example_1: Refreshing state... [id=ca527369d9e8c1e081558bd92f90f65c4eb77e21]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # local_file.tf_example_1 will be destroyed
  - resource "local_file" "tf_example_1" {
      - content              = "new content" -> null
      - content_base64sha256 = "/jJgjJ71ts9+P5RkgCU/928k9OwGePPQ8H+YRMv/lgE=" -> null
      - content_base64sha512 = "v5QnIpJeO2SE7srnyMXGsg+yntId1CpC2tniC+P+lZOS3lqEUW6hyoM9vb7zd1ynN7hXGXvQw168oi/KiJ9uJA==" -> null
      - content_md5          = "96c15c2bb2921193bf290df8cd85e2ba" -> null
      - content_sha1         = "ca527369d9e8c1e081558bd92f90f65c4eb77e21" -> null
      - content_sha256       = "fe32608c9ef5b6cf7e3f946480253ff76f24f4ec0678f3d0f07f9844cbff9601" -> null
      - content_sha512       = "bf942722925e3b6484eecae7c8c5c6b20fb29ed21dd42a42dad9e20be3fe959392de5a84516ea1ca833dbdbef3775ca737b857197bd0c35ebca22fca889f6e24" -> null
      - directory_permission = "0777" -> null
      - file_permission      = "0777" -> null
      - filename             = "./example_1.txt" -> null
      - id                   = "ca527369d9e8c1e081558bd92f90f65c4eb77e21" -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

local_file.tf_example_1: Destroying... [id=ca527369d9e8c1e081558bd92f90f65c4eb77e21]
local_file.tf_example_1: Destruction complete after 0s

Destroy complete! Resources: 1 destroyed.
```

### <span style="color: lightblue">Save Terraform plan</span>

Terraform plan out command:

```zsh
terraform plan -out=./plan1
```

Apply the saved plan:

```zsh
terraform apply "./plan1"
```

### <span style="color: lightcoral">Important notes</span>

- Terraform resource reference names should be <span style="color: pink">**unique**</span>
- If resource type is same, then resource reference names can be identical

