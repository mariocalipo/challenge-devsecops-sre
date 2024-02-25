module "pubsub-bq-01" {
  source              = "./modules/pubsub_bq"
  bigquery_dataset    = var.config.bigquery-01.bigquery_dataset
  bigquery_table      = var.config.bigquery-01.bigquery_table
  pubsub_topic        = var.config.pubsub-01.topic
  pubsub_subscription = var.config.pubsub-01.subscription
}