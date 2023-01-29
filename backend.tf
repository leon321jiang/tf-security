terraform {
  backend "s3" {
    bucket  = "terraform-state-bucket-leon"
    key     = "dev" ## this needs to be changed per region
    region  = "us-east-2" // this is the bucket tfm-sec-state bucket is
    profile = "default"   // this is where the aws config profile of tfm-sec-state bucket is
    encrypt = true
  }
}