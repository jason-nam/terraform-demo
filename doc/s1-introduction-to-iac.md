# <span style="color: lightgreen">Introduction to Infrastructure as Code (IaC)</span>

## <span style="color: lightyellow">Overview</span>

### <span style="color: lightblue">What you will learn</span>

1. Introduction to Infrastructure as Code (IaC)
2. IaC with Terraform
3. Terraform Core Concepts
4. Build a complete Practice project

## <span style="color: lightyellow">Introduction to Infrastructure as Code (IaC)</span>

HashiCorp Terraform is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share.

### <span style="color: lightblue">What do we mean by "Infrastructure"?</span>

- Everything that supports the application/service to run
- Includes:
  - servers
  - network configurations
  - storage
  - monitoring
- Types - Physical, On Cloud, Hybrid, Edge Infrastructure

### <span style="color: lightblue">Managing your Infrastructure - "The Traditional Way"</span>

How did that happend?

- Physical or On-prem
- Any changes needed - <span style="color: pink;">**were made "manually"**</span>
- Working fine - <span style="color: pink;">**because changes were rare!**</span>
- Problems:
  - **Not able to scale** based on demand
  - **High** maintenance cost
  - **Low flexibility** - challenging to re-configure again

### <span style="color: lightblue">Managing your Infrastructure - Shift to Cloud Environments</span>

What changes we observed?

- Infra. components are API-driven - <span style="color: pink">**low manual effort**</span>
- Able to scale up or down - <span style="color: pink">**on demand**</span>
- Takes **less time to maintain** - handles by the Provider
- Benefits:
  - **Easily customizable** based on needs
  - Cost efficient - <span style="color: pink">**"Pay as you go"**</span>
  - Easily <span style="color:pink">**deploy + manage**</span> resources across multiple regions

But, there are problems!
  
- Low of **"manual" effort** - How?
- Inconsistencies due to <span style="color: pink">**Configuration Drift**</span>
  - When there is no consistency in the different environments of the infrastructure
- **Scaling becomes** complex - again
- What is the solution that makes sense? **Define the Infrastructure "as Code"**

### <span style="color: lightblue">Infrastructure as Code (IaC)</span>

Infrastructure as Code (IaC) allows you to <span style="color: pink">**manage infrastructure with configuration files**</span> rather than through a graphical user interface.

- **Core Idea:** Write code to define the <span style="color: pink">**"desired state"**</span> of your infrastructure
- **Benefits:** 
  - **Consistent** across different environments
  - We are **"automating" the process** entirely - saves time and efforts
  - **Version Control**

Tools to provision your infrastructure code!

#### Cloud Specific

Infra. on a **single** cloud provider

- AWS CloudFormation
- AWS Elastic Beanstalk
- Google Cloud Deployment Manager
- Azure Resource Manager Templates
- Azure Blueprints

#### Cloud Agnostic

Infra. on a **multiple** cloud providers

- Terraform
- Pulumi
- OpenTofu