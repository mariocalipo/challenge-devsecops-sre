module "bigquery-01" {
  source           = "./modules/bigquery"
  bigquery_dataset     = var.config.bigquery-01.bigquery_dataset
  bigquery_table = var.config.bigquery-01.bigquery_table
}