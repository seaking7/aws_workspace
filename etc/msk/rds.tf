
resource "aws_rds_cluster" "postgresql" {
  cluster_identifier      = "aurora-ssp"
  engine                  = "aurora-postgresql"
#   engine_mode = "provisioned"
#   engine_version = "15.4"
  port = 5432
  availability_zones      = local.availability_zones
  db_subnet_group_name = aws_db_subnet_group.default.name
  database_name           = "mydb"
  master_username         = "foo"
  master_password         = "Rlaxorud1!"
  backup_retention_period = 5
  preferred_backup_window = "04:00-06:00"
#   tags = "ssp-aurora-db"
  vpc_security_group_ids = local.broker_node_security_groups
  final_snapshot_identifier = "ssp-aurora-final-snapshot"
  skip_final_snapshot = true # 상용에서는 false 검토


  ## multi-AZ parameter
#   db_cluster_instance_class = "db.r6g.large"
#   storage_type              = "io1"
#   allocated_storage         = 100       ## GB. each DB instance in the Multi-AZ 
#   iops                      = 1000
}


resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = local.subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}