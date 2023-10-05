provider "google" {
  project     = "norse-block-303620"
  region      = "europe"
  zone        = "europe-central2-a"
  credentials = file("~/.config/gcp/norse-block-303620-de9ec0053009.json")
}