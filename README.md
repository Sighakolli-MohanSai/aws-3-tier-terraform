# AWS 3-Tier Architecture using Terraform

## 📌 Project Overview

This project demonstrates the design and provisioning of a **secure, scalable, and highly available 3-tier architecture on AWS using Terraform Infrastructure as Code (IaC)**.

The infrastructure was provisioned using Terraform instead of manually creating each AWS resource through the AWS Management Console.

The project covers the complete Infrastructure-as-Code lifecycle:

**Terraform Code → Plan → Apply → Verify → Destroy**

---

## 🏗️ Architecture

![AWS 3-Tier Architecture](architecture-diagram.png)

The architecture is deployed in **AWS US East (Ohio) — `us-east-2`** across two Availability Zones.

The three primary tiers are:

* **Web Tier** — Application Load Balancer
* **Application Tier** — EC2 + Auto Scaling
* **Database Tier** — Amazon RDS

---

## ☁️ AWS Services Used

### Networking

* Amazon VPC
* Public Subnets
* Private Subnets
* Internet Gateway
* NAT Gateway
* Elastic IP
* Route Tables
* Route Table Associations

### Web / Load Balancing

* Application Load Balancer (ALB)
* Target Group
* HTTP Listener

### Application

* Amazon EC2
* Launch Template
* Auto Scaling Group
* Apache Web Server

### Database

* Amazon RDS
* RDS DB Subnet Group

### Security

* Application Load Balancer Security Group
* Application/EC2 Security Group
* Database/RDS Security Group

### Monitoring

* Amazon CloudWatch

### Infrastructure as Code

* Terraform

---

## 🌐 Network Architecture

The project uses a custom VPC with CIDR:

```text
10.0.0.0/22
```

The VPC is distributed across two Availability Zones:

```text
us-east-2a
us-east-2b
```

### Public Layer

The public subnets contain the internet-facing Application Load Balancer.

Internet traffic follows:

```text
Internet
   ↓
Internet Gateway
   ↓
Application Load Balancer
```

### Application Layer

EC2 instances are deployed in private subnets through an Auto Scaling Group.

The application traffic flows:

```text
ALB
 ↓
Target Group
 ↓
EC2 Instances
```

The EC2 instances run Apache, which is installed automatically using EC2 user data from the Terraform Launch Template.

### Database Layer

Amazon RDS is placed in the private database subnet architecture and is protected by a dedicated database Security Group.

The application-to-database flow is:

```text
EC2
 ↓
RDS
```

The database is not directly exposed to the internet.

---

## 🔐 Security Design

Separate Security Groups were created for each major tier.

### ALB Security Group

Allows HTTP traffic from the internet to the Application Load Balancer.

### Application Security Group

Allows application traffic from the ALB rather than exposing the EC2 instances directly to the internet.

### Database Security Group

Allows database connectivity from the application tier.

This creates controlled communication between the different tiers.

---

## ⚖️ High Availability & Scaling

The Application Load Balancer and application infrastructure are distributed across two Availability Zones.

The Auto Scaling Group was configured with:

```text
Minimum Capacity : 2
Desired Capacity : 2
Maximum Capacity : 4
```

This provides:

* Multiple EC2 instances
* Load distribution
* Automatic instance replacement
* Horizontal scaling capability
* Multi-AZ application deployment

---

## 📊 Monitoring

Amazon CloudWatch was configured as part of the infrastructure to provide monitoring capabilities for the AWS environment.

---

## 🛠️ Terraform Project Structure

```text
aws-3-tier-terraform/
│
├── README.md
├── architecture-diagram.png
│
├── provider.tf
├── vpc.tf
├── subnet.tf
├── igw.tf
├── Publicroute.tf
├── PrivateRoute.tf
├── nat.tf
├── elasticip.tf
│
├── alb.tf
├── targetGroup.tf
├── listener.tf
│
├── launch_template.tf
├── autoScaling.tf
│
├── rds.tf
│
├── albSG.tf
├── appSG.tf
├── dbSG.tf
│
├── cloudwatch.tf
├── .gitignore
└── .terraform.lock.hcl
```

---

## 🚀 Terraform Workflow

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Validate Configuration

```bash
terraform validate
```

### 3. Review Infrastructure Changes

```bash
terraform plan
```

### 4. Provision Infrastructure

```bash
terraform apply
```

### 5. Verify the Infrastructure

The deployed infrastructure can be verified through AWS services such as:

* VPC
* EC2
* Application Load Balancer
* Target Group
* Auto Scaling
* RDS
* CloudWatch

### 6. Destroy the Infrastructure

After completing the hands-on testing:

```bash
terraform destroy
```

The infrastructure was also successfully destroyed using Terraform after validation.

---

## 📚 Terraform Concepts Practiced

This project provided hands-on experience with:

* Infrastructure as Code
* Terraform providers
* Terraform resources
* Resource dependencies
* Terraform state
* Terraform plan and apply workflow
* Launch Templates
* Auto Scaling
* AWS networking
* Security Groups
* Load Balancing
* Multi-AZ architecture
* Private and public subnets
* Terraform resource lifecycle
* Infrastructure destruction using Terraform

---

## 🎯 Key Learning Outcomes

The main objective of this project was to understand how multiple AWS services work together to form a complete application architecture.

The project provided practical experience in:

**AWS Networking → Security → Load Balancing → Compute → Auto Scaling → Database → Monitoring**

More importantly, the same infrastructure was defined and managed using **Terraform Infrastructure as Code**, demonstrating how cloud infrastructure can be provisioned consistently without manually creating every resource through the AWS Console.

---

## 💻 Technology Stack

| Technology                | Purpose                 |
| ------------------------- | ----------------------- |
| Terraform                 | Infrastructure as Code  |
| AWS VPC                   | Network isolation       |
| AWS EC2                   | Application compute     |
| Application Load Balancer | Traffic distribution    |
| Auto Scaling              | Application scalability |
| Amazon RDS                | Relational database     |
| CloudWatch                | Monitoring              |
| Security Groups           | Network security        |
| Apache                    | Web server              |

---

## ⚠️ Security Note

Terraform state files and sensitive configuration files are intentionally excluded from this repository.

The following files/directories should **not** be committed:

```text
terraform.tfstate
terraform.tfstate.backup
.terraform/
*.tfvars
```

No AWS credentials or sensitive secrets should be stored in the repository.

---

## 👨‍💻 Project Objective

This project was created as a hands-on learning and portfolio project to strengthen practical skills in:

**AWS Cloud + Terraform + Infrastructure as Code + DevOps**

The infrastructure was provisioned, tested, and successfully destroyed using Terraform.
