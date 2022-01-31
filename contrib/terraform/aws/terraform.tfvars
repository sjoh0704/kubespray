# Landing Zone
landing_vpc_id = "vpc-0beebeb4dcef32426"
landing_ec2_subnet_id = "subnet-089914b2d9609a862"
landing_vpc_cidr_block = "10.0.0.0/16"

#Global Vars
aws_cluster_name = "devtest"

#VPC Vars
aws_vpc_cidr_block       = "10.10.0.0/16"
aws_cidr_subnets_public  = ["10.10.1.0/24"]
aws_cidr_subnets_private = ["10.10.6.0/24"]

#Bastion Host
aws_bastion_num  = 1
aws_bastion_size = "t3.medium"

#Kubernetes Cluster
aws_kube_master_num  = 1
aws_kube_master_size = "t3.medium"
aws_kube_master_disk_size = 50

aws_etcd_num  = 1
aws_etcd_size = "t3.medium"
aws_etcd_disk_size = 50

aws_kube_worker_num  = 1
aws_kube_worker_size = "t3.medium"
aws_kube_worker_disk_size = 50

#EC2 Source/Dest Check
aws_src_dest_check      = false

#Settings AWS ELB
aws_elb_api_port          = 6443
k8s_secure_api_port       = 6443
aws_elb_api_internal      = true
aws_elb_api_public_subnet = false

default_tags = {
  #  Env = "devtest"
  #  Product = "kubernetes"
}

#Setting VPN Connection

vpn_connection_enable = false
customer_gateway_ip   = ""
local_cidr            = ""

inventory_file = "../../../inventory/hosts"
