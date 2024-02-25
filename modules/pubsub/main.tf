// Named resource to which messages are sent by publishers

resource "google_pubsub_topic" "main" {
  name = var.pubsub_topic.name
}

// Named resource representing the stream of messages from a single, specific topic, to be delivered to the subscribing application
resource "google_pubsub_subscription" "main" {
  name   = var.pubsub_subscription.name
  topic  = google_pubsub_topic.main.id
}
