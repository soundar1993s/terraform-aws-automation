terraform {
  backend "s3" {
    bucket       = "guvi-project03-tfstate-4c4a8ab3"
    key          = "project-03/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}