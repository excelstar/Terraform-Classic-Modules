module "rds-ms-sql" {
  source = "./modules/rds-ms-sql"

  region = "eu-west-2"
  identifier = "cloudgeeks-db-app2-dev"
  final-snapshot-identifier = "cloudgeeks-db-final-snap-shot"
  rds-allocated-storage = "20"
  rds-engine = "sqlserver-ex"
  engine-version = "14.00.3035.2.v1"
  db-instance-class = "db.t2.micro"
  backup-retension-period = "0"
  backup-window = "04:00-06:00"
  publicly-accessible = "false"
  rds-username = "demo"
  rds-password = "thisisjustademo"
  multi-az = "false"
  storage-encrypted = "false"
  deletion-protection = "false"

  vpc-security-group-ids = "${module.rds-sg.aws-security-group-rds}"
  rds-private-subnets-groups-name = "cloudgeeks-rds-private-subnets-group"
  rds-private-subnets-groups-description = "Allowed Only Private Subnets for cloudgeeks-RDS-ms-sql"
  aws-db-subnet-group-private-subnets = "${module.vpc.private-subnet-ids}"
  name-aws-db-subnet-group = "cloudgeeks-rds-subnets-groups"
}
