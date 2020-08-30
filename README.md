# Provisioning of AWS EC2 Instance using Terraform

Terraform is an open source tool developed by Hashicorp, which allows you to
codify your infrastructure. This method is called as Infrastructure-As-Code(IAC). Through this method we can write configuration files instead of clicking in the AWS console to make infrastructure.

This repository consist of terraform module for provisioning EC2 instance(s) on AWS.

## Prerequisite
* [Terraform](https://www.terraform.io/) (tested on v0.12)
* [Amazon Web Services CLI (aws-cli)](https://aws.amazon.com/cli/)
* [AWS Key
Pair](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair)


**Note: Terraform and aws-cli can be installed with `brew install` on Mac.**

## Configuration
#### AWS Key Pair
The instructions for creating an AWS Key Pair are
[here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair).
This key needs to be created in the corresponding AWS region. The name of the key pair has to be the same as the one listed in the AWS console. You will need to specify this in the `my_key_pair_name` variable (see Section [Variables](#variables)).

#### Variables
This demo terraform script creates makes a EC2 Instance request for a
`t2.micro` in AWS.

In the `variables.tf` file some of the variables you can configure for your
setup are:
```sh
    * my_region                 (default = eu-central-1)       # Frankfurt
    * avail_zone                (default = eu-central-1b)
    * my_key_pair_name          (default = test-key-pair)
    * instance_type             (default = t2-micro)
    * num_instances             (default = 1)
    * ebs_volume_size           (default = 1)
    * ami_id                    (default = ami-07dfba995513840b5) # Default Red Hat Enterprise Linux 8 (RHEL)
```

**Note: Above AMI is specific to the particular region. AMI ID will be changing to region to region.**

## Quick Start

1. Configure your `AWS Access Key`, `AWS Secret Access Key`, and `region name`:
```sh
$ aws configure
AWS Access Key ID [None]: ********
AWS Secret Access Key [None]: ********
Default region name [None]: eu-central-1
```
2. Installation of Terraform need to be checked by below command.
```sh
$ terraform
```

3. Initialize terraform by using below command.
```sh
$ terraform init
```

4. Create the terraform execution plan. This step will validate and provide you list of changes which get for getting the desired state.
```sh
$ terraform plan
```

5. Provision the instance(s) by applying the changes to get the desired state
based on the plan:
```sh
$ terraform apply
```

6. After provision, the EC2 instance can be logged in using SSH.
```sh
$ ssh -i test-key-pair.pem ec2-user@<public-ip>
```

7. Once done with the infrastructure, you can destroy it.
```sh
$ terraform destroy

## Troubleshooting

1. Step 3 in the [Quick Start](#quick-start) section allows you to view the
output configurations in the terminal, but you can also save the execution plan
for debugging purposes:
```sh
$ terraform plan -refresh=true -input=False -lock=true -out=./proposed-changes.plan


2. View the output from the `.plan` file in human-readable format:
```sh
$ terraform show proposed-changes.plan
```

## References

* [Terraform Introduction](https://www.terraform.io/intro/index.html)
* [The Terraform Book](https://terraformbook.com/)
