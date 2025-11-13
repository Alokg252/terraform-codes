module "rds-aurora_example_postgresql" {
  source  = "terraform-aws-modules/rds-aurora/aws//examples/postgresql"
  version = "9.16.1"
}