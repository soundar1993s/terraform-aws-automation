module "networking" {
  source = "./modules/networking"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
  environment         = var.environment
}
module "compute" {
  source = "./modules/compute"

  environment   = var.environment
  vpc_id        = module.networking.vpc_id
  subnet_id     = module.networking.public_subnet_ids[0]
  instance_type = var.instance_type
  ami_id        = var.ami_id
  user_data     = file("${path.module}/user-data.sh")
  s3_bucket_arn = aws_s3_bucket.app_bucket.arn
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "guvi-project03-${var.environment}-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "guvi-project03-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "app_bucket" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}