terraform {
  backend "s3" {
    bucket = "julianddd-tf-state"
    key    = "julianddd-tf-state"
    region = "eu-west-2"
  }
}