# Packer AMI Build Project
This project contains a Packer template for building an Amazon Machine Image (AMI) on an Ubuntu base that installs Nginx, Git, and Docker. The AMI is built for an EC2 instance, and the instance is configured with basic provisioning to serve content using Nginx.

# Project Structure

-  **main.pkr.hcl:** The main Packer configuration file.
-  **packer-vars.json:** Contains the variables such as AWS credentials, region, AMI ID, instance type, VPC, and subnet details.
-  **variables.pkr.hcl:** The Packer variables file.

# Prerequisites
Before running this Packer build, ensure you have the following:

-  Packer installed. You can download it from here https://developer.hashicorp.com/packer/install?product_intent=packer.
-  AWS CLI installed and configured with your AWS credentials.

# Configuration

1. Variables (packer-vars.json) The packer-vars.json file contains the following key information:

		{
                "aws_access_key": "abc",
                "aws_secret_key": "xyz",
                "region": "us-east-2",
                "source_ami": "ami-0ea3c35c5c3284d82",
                "instance_type": "t2.micro",
                "vpc_id": "vpc-09a4ce0aa31937649",
                "subnet_id": "subnet-0fc0b086ab9266897",
                "aws_profile": "user1"
		} 

**-  aws_access_key and aws_secret_key:** Your AWS credentials. Replace "abc" and "xyz" with your actual credentials.

**-  region:** The AWS region where the AMI will be built (e.g., us-east-2).

**-  source_ami:** The base AMI to use for the build (in this case, an Ubuntu AMI).

**-  instance_type:** The type of EC2 instance (e.g., t2.micro).

**-  vpc_id and subnet_id:** The VPC and Subnet where the instance will be launched.

**-  aws_profile**: Your AWS profile, if applicable.

3. Packer Configuration (main.pkr.hcl)

The main.pkr.hcl file defines the configuration for Packer. It uses the variables defined in packer-vars.json to customize the build. It includes provisioning scripts that install Nginx, Git, and Docker, and configure a web server to serve content from a cloned Git repository.

4. Variables File (variables.pkr.hcl)

The variables.pkr.hcl file defines variables used in the Packer build. Ensure that this file contains the correct variables for your environment.

# Steps to Build the AMI:

1. Clone the Repository
Clone this repository to your local machine:
## 
    git clone https://github.com/mohit-decoder/packer.git

2. Make neccersary changes
Make the neccessary changes in file **packer-vars.json**

3. Run Export command
##
    export AWS_ACCESS_KEY_ID=your_access_key
    export AWS_SECRET_ACCESS_KEY=your_secret_key

4. Validate the Packer Template
Run the following command to ensure the Packer template is valid:
##
    packer validate -var-file=packer-vars.json .

3. Build the AMI
Run the following command to start building the AMI:
##
    packer build -var-file=packer-vars.json .

During the build, Packer will launch an EC2 instance using the base AMI, install necessary packages, and configure Nginx to serve content from a cloned Git repository.
![Screenshot (41)](https://github.com/user-attachments/assets/93ee4e4f-4b40-422a-bb62-fbbf2af22c85)


