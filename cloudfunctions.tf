module "combined_function" {
  source                  = "./modules/cloudfunctions_function"
  storage_bucket          = var.config.combined_function.storage_bucket
  storage_bucket_object   = var.config.combined_function.storage_bucket_object
  cloudfunctions_function = var.config.combined_function.cloudfunctions_function
}