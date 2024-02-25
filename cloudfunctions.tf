module "bq_query" {
  source                  = "./modules/cloudfunctions_function"
  storage_bucket          = var.config.bq_query.storage_bucket
  storage_bucket_object   = var.config.bq_query.storage_bucket_object
  cloudfunctions_function = var.config.bq_query.cloudfunctions_function
}

module "http_response" {
  source                  = "./modules/cloudfunctions_function"
  storage_bucket          = var.config.http_response.storage_bucket
  storage_bucket_object   = var.config.http_response.storage_bucket_object
  cloudfunctions_function = var.config.http_response.cloudfunctions_function
}