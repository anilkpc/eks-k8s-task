module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "2.10.0"
  bucket = "eks-tf-state-file"
  acl    = "private"

  versioning = {
    enabled = true
  }

}