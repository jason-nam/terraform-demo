# <span style="color: lightgreen">IaC with Terraform</span>

## <span style="color: lightyellow">Infrastructure as Code Using Terraform</span>

### <span style="color: lightblue">Introduction to Terraform</span>

HashiCorp Terraform is an <span style="color: pink">**infrastructure as code tool**</span> that lets you define both **cloud and on-prem resources** in **human-readable configuration files** that you can **version, reuse, and share**.

- Uses **HCL (HashiCorp Configuration Language)**

  ```hcl
  resource "aws_instance" "tf_server" {
    ami = "ami-0e86e20dae9224db8"
    instance_type = "t2.micro"
    associate_public_ip_address = true
    key_name = "aws-01"
    user_data = file("userdata.tpl")

    tags = {
      Name = "nodejs-server"
    }
  }
  ```
- Follows a **Declarative approach**
- **Automates** infra. lifecycle management
- **Version Control** and Reusable

### <span style="color: lightblue">How does Terraform work?</span>

Whats happening in the backend!

![Alt text](assets/Screenshot%202025-11-13%20at%2010.43.00 AM.png "Terraform")

Typically workflow of working with Terraform

![Alt text](assets/Screenshot%202025-11-13%20at%2010.44.45 AM.png "Terraform Workflow")

