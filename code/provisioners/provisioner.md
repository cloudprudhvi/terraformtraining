# Types of Provisioners in Terraform

Provisioners in Terraform are used to execute scripts or commands on a local or remote machine as part of resource creation or destruction. They help with bootstrapping, configuration management, and other post-deployment tasks.

## 1. Local-Exec Provisioner

- **Purpose:** Runs a command locally on the machine where Terraform is executed.
- **Use Case:** Useful for tasks like sending notifications, running local scripts, or interacting with other tools after a resource is created.
- **Example:**
  ```hcl
  provisioner "local-exec" {
    command = "echo Instance ${self.id} created!"
  }
  ```

## 2. Remote-Exec Provisioner

- **Purpose:** Runs commands on a remote resource (like an EC2 instance) after it is created.
- **Use Case:** Used for installing software, updating packages, or configuring the instance remotely.
- **Example:**
  ```hcl
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install nginx -y"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }
  ```

## 3. File Provisioner

- **Purpose:** Copies files from the local machine to the remote resource.
- **Use Case:** Used for transferring scripts, configuration files, or other assets to the instance.
- **Example:**
  ```hcl
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }
  ```
