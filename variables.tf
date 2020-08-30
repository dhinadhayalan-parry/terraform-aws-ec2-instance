variable "my_region" {
  type        = string
  default     = "eu-central-1"
  description = "The AWS region to deploy into (i.e. eu-central-1)"
}

variable "avail_zone" {
  type        = string
  default     = "eu-central-1b"
  description = "The AWS availability zone location within the selected region (i.e. eu-central-1b)."
}

variable "my_cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "my_key_pair_name" {
  type        = string
  default     = "test-key-pair"
  description = "The name of the SSH key to install onto the instances."
}

variable "ssh-key-dir" {
  default     = "~/.ssh/"
  description = "The path to SSH keys - include ending '/'"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The instance type to provision the instances from (i.e. t2.micro)."
}

variable "ebs_volume_size" {
  type        = string
  default     = "1"
  description = "The Amazon EBS volume size (1 GB - 16 TB)."
}

variable "ami_id" {
  type        = string
  default     = "ami-07dfba995513840b5" # Default Red Hat Enterprise Linux 8 (RHEL)
  description = "The AMI ID to use for each instance. The AMI ID will be different depending on the region, even though the name is the same."
}

variable "num_instances" {
  type        = string
  default     = "1"
  description = "The number of AWS EC2 instances to provision."
}
