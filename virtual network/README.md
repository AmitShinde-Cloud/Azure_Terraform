
# Project Title

🚀 Terraform Azure VM Project (Linux & Windows)

This project demonstrates how to provision **Azure Infrastructure** using **Terraform**, including:

- Resource Group
- Virtual Network & Subnet
- Public IP
- Network Interface
- Linux Virtual Machine (RHEL)
- Windows Virtual Machine

## 🏗️ Architecture Overview

This project creates a complete Azure environment with networking and virtual machines.

---

## ⚙️ Technologies Used
- ☁️ Azure (azurerm provider)
- 🏗️ Terraform
- 🐧 Linux VM (RHEL)
- 🪟 Windows VM
- 🌐 Networking (VNet, Subnet, Public IP)

## 🚀 Resources Created

### 🌐 Networking
- Virtual Network (10.0.0.0/16)
- Subnet (10.0.2.0/24)
- Public IP (Dynamic)
- Network Interface

### 🖥️ Virtual Machines
- Linux VM (RHEL 8.3)
- Windows Server VM (2016 Datacenter)

---
⭐ If you like this project, give it a star!

# 🧭 Architecture Diagram (Simple)

                          +---------------------------+
                          |     Resource Group        |
                          |         (myrg-1)          |
                          +------------+--------------+
                                       |
                                       |
                          +------------v--------------+
                          |     Virtual Network       |
                          |      10.0.0.0/16          |
                          +------------+--------------+
                                       |
                          +------------v--------------+
                          |          Subnet           |
                          |       10.0.2.0/24         |
                          +------------+--------------+
                                       |
                          +------------v--------------+
                          |   Network Interface (NIC) |
                          +------------+--------------+
                                       |
                   +-------------------+-------------------+
                   |                                       |
        +----------v----------+               +-------------v----------+
        |    Linux VM (RHEL)  |               |   Windows VM           |
        |    mylinuxvm-1      |               |   mywindwsvm-1         |
        +----------+----------+               +-------------+----------+
                   |                                        |
                   +-------------------+--------------------+
                                       |
                          +------------v--------------+
                          |        Public IP          |
                          +---------------------------+


## Documentation

🚀 Project: Azure Infrastructure Deployment using Terraform
📌 Project Overview

This project demonstrates how to provision a complete Azure cloud infrastructure using Terraform (Infrastructure as Code). It includes networking components and deployment of both Linux (RHEL) and Windows virtual machines within a secure and scalable environment.

The goal of this project is to showcase real-world DevOps practices, including automation, modular design, and cloud resource management.

🏗️ Architecture Components Explained
1️⃣ Resource Group

Acts as a logical container for all Azure resources

Helps in managing, monitoring, and organizing resources

Name: myrg-1

2️⃣ Virtual Network (VNet)

Defines a private network in Azure

IP Range: 10.0.0.0/16

Enables secure communication between resources

3️⃣ Subnet

Subdivision of the Virtual Network

IP Range: 10.0.2.0/24

Used to isolate workloads inside the VNet

4️⃣ Public IP Address

Allows external internet access to virtual machines

Allocation Method: Dynamic

Required for SSH/RDP connectivity

5️⃣ Network Interface (NIC)

Connects Virtual Machines to the network

Linked with:

Subnet

Public IP

Acts as a bridge between VM and network

6️⃣ Linux Virtual Machine (RHEL)

OS: Red Hat Enterprise Linux (RHEL 8.3 Gen2)

Size: Standard_DS1_v2

Authentication: Username & Password

Used for:

Web servers

DevOps tools

Application hosting

7️⃣ Windows Virtual Machine

OS: Windows Server 2016 Datacenter

Size: Standard_F2

Access via RDP

Used for:

Windows-based applications

Enterprise workloads

📁 File-Level Explanation
📄 provider.tf
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

🔍 Purpose:

Defines Terraform version requirements

Configures Azure provider (azurerm)

Enables communication with Azure APIs

📄 main.tf

🔍 Contains core infrastructure resources:

✔ Resource Group
resource "azurerm_resource_group" "myrg"

Creates base container for all resources

✔ Virtual Network
resource "azurerm_virtual_network" "myvnet"

Defines network space (10.0.0.0/16)

✔ Subnet
resource "azurerm_subnet" "mysubnet"

Creates subnet inside VNet

✔ Public IP
resource "azurerm_public_ip" "mypublicip"

Provides internet access

✔ Network Interface
resource "azurerm_network_interface" "myvm1nic"

Connects VM to subnet + public IP

📄 linux.tf

🔍 Creates Linux VM

resource "azurerm_linux_virtual_machine" "mylinuxvm"

✔ Key Features:

Uses RHEL image

Attaches NIC

Configures OS disk

Enables password authentication

Applies tags

📄 windows.tf

🔍 Creates Windows VM

resource "azurerm_windows_virtual_machine" "mywindowsvm"

✔ Key Features:

Windows Server 2016 image

RDP access enabled

Uses same NIC

Configures OS disk

📄 variables.tf

🔍 Purpose:

Store reusable variables (currently empty/commented)

Helps avoid hardcoding values

👉 Recommended to define:

Region

VM size

Credentials

⚙️ How It Works (Execution Flow)

Terraform initializes Azure provider

Resource Group is created

Virtual Network & Subnet are provisioned

Public IP is allocated

Network Interface is created

Linux & Windows VMs are deployed and attached to NIC

🔐 Security Considerations

Avoid hardcoding credentials (use variables or Key Vault)

Prefer SSH keys over passwords for Linux VM

Restrict public access using NSG (Network Security Group)

🧠 Key Learnings

Infrastructure as Code (IaC) using Terraform

Azure Networking concepts (VNet, Subnet, NIC)

VM provisioning (Linux & Windows)

Resource dependency management in Terraform

Tagging strategy for resource organization

