module "pubsub-01" {
  source           = "./modules/pubsub"
  pubsub_topic     = var.config.pubsub-01.topic
  pubsub_subscription = var.config.pubsub-01.subscription
}