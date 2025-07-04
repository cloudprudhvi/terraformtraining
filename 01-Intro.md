# Introduction to Terraform

In today’s IT world, managing infrastructure is a very important task. Traditionally, people used to set up servers, networks, and storage manually. For example, if you want to launch a web application, you might log in to AWS or Azure portal, click around to create virtual machines, set up security groups, configure storage, and so on. This manual process is time-consuming, error-prone, and difficult to repeat for multiple environments like development, testing, and production.

## Traditional Infrastructure Management Example

Suppose you are working in a company that wants to host a website. You need to:

- Create a virtual machine (VM) in AWS EC2.
- Set up security groups to allow HTTP/HTTPS traffic.
- Attach a storage volume.
- Install web server software.
- Configure networking.

If you do this manually for every environment, you may forget some steps, make mistakes, or find it hard to keep everything consistent. If you want to scale up or down, you have to repeat the same steps again and again.

### Issues with Manual Approach

- **Human errors:** Missing steps or wrong configurations.
- **Time-consuming:** Takes a lot of time to set up or make changes.
- **No version control:** Hard to track what changed and when.
- **Not repeatable:** Difficult to create identical environments.
- **Scaling is hard:** Manual work increases with scale.

## What is Terraform?

Terraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp. It allows you to define your infrastructure using simple, human-readable configuration files (in HCL - HashiCorp Configuration Language). You can write code to describe what resources you want (like servers, databases, networks), and Terraform will create, update, or delete them automatically.

### How Terraform Solves the Problems

- **Automation:** Write code once, use it to create or change infrastructure any number of times.
- **Consistency:** Same code gives same results every time.
- **Version control:** Store your code in Git, track changes, roll back if needed.
- **Idempotency:** Running the same code multiple times does not create duplicate resources.
- **Multi-cloud:** Use the same tool for AWS, Azure, GCP, and more.

#### Example

```hcl
resource "aws_instance" "web" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
}
```
With just a few lines, you can create a VM in AWS. If you want 3 VMs, just change a number in the code.

## Pros of Terraform

- Easy to automate and manage infrastructure.
- Supports many cloud providers.
- Infrastructure is documented as code.
- Easy to reuse and share code (modules).
- Detects and shows what changes will happen before applying.

## Cons of Terraform

- Learning curve for HCL and Terraform concepts.
- State file management can be tricky.
- Not ideal for every use case (e.g., some on-premise setups).
- Sometimes provider plugins may lag behind new cloud features.

---

## Common Interview Questions

**Q1: Why do we use Terraform?**  
A: To automate, standardize, and version control infrastructure deployment, making it faster, repeatable, and less error-prone.

**Q2: What is idempotency in Terraform?**  
A: Idempotency means running the same Terraform code multiple times will not create duplicate resources; the end state will always be the same as defined in the code.

**Q3: How does Terraform differ from tools like Ansible or Chef?**  
A: Terraform is mainly for provisioning infrastructure (servers, networks), while Ansible/Chef are more for configuration management (installing software, managing files).