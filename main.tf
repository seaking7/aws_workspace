
module "tf_vpc" {
  source = "./modules/vpc"
  aws_region = var.aws_region
  vpc_cidr = var.vpc_cidr
  public_cidr = var.public_cidr
  private_cidr = var.private_cidr
  
}

module "tf_eks" {
  source = "./modules/eks"
  aws_region = var.aws_region
  eks-cluster-name = var.eks-cluster-name
  vpc_id = module.tf_vpc.vpc_id
  subnet_id_1 = module.tf_vpc.public_subnet_1_id
  subnet_id_2 = module.tf_vpc.public_subnet_2_id
}