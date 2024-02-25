module "cloudfunctions-01" {
  source                  = "./modules/cloudfunctions_function"
  storage_bucket          = var.config.cloudfunctions-01.storage_bucket
  storage_bucket_object   = var.config.cloudfunctions-01.storage_bucket_object
  cloudfunctions_function = var.config.cloudfunctions-01.cloudfunctions_function
}