variable "cluster-name" {
  default     = "k8s-cluster"
  type        = string
  description = "The name of your EKS Cluster"
}

variable "aws-region" {
  default     = "us-east-1"
  type        = string
  description = "The AWS Region to deploy EKS"
}

variable "availability-zones" {
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  type        = list
  description = "The AWS AZ to deploy EKS"
}

variable "k8s-version" {
  default     = "1.21"
  type        = string
  description = "Required K8s version"
}


variable "vpc-subnet-cidr" {
  default     = "10.0.0.0/16"
  type        = string
  description = "The VPC Subnet CIDR"
}

variable "private-subnet-cidr" {
  default     = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
  type        = list
  description = "Private Subnet CIDR"
}

variable "public-subnet-cidr" {
  default     = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20"]
  type        = list
  description = "Public Subnet CIDR"
}

variable "db-subnet-cidr" {
  default     = ["10.0.192.0/21", "10.0.200.0/21", "10.0.208.0/21"]
  type        = list
  description = "DB/Spare Subnet CIDR"
}

variable "eks-cw-logging" {
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  type        = list
  description = "Enable EKS CWL for EKS components"
}

variable "node-instance-type" {
  default     = "m4.large"
  type        = string
  description = "Worker Node EC2 instance type"
}

variable "root-block-size" {
  default     = "20"
  type        = string
  description = "Size of the root EBS block device"

}

variable "desired-capacity" {
  default     = 2
  type        = string
  description = "Autoscaling Desired node capacity"
}

variable "max-size" {
  default     = 5
  type        = string
  description = "Autoscaling maximum node capacity"
}

variable "min-size" {
  default     = 1
  type        = string
  description = "Autoscaling Minimum node capacity"
}

variable "ec2-key-public-key" {
  default     = "ssh-rsa h4D7y4O5U+YoXFPdczwc2ByNluU2pOhGUf38vo0KvdrsJytvrvAAAAwQD35Gf9hj3kR60bYft6nm4gnq78peu+axPa1+kAofNO2j3Gc9KDDAWeVRBoyjzQCBcO95PMgq2w5od6/otAJ6/Mrpp64A0ZXg6l/RlpnkatErg9BanpPw5+/5SXmLDrVNGEN4vz7umVjKAzeEbY/08nU3CHv70MgVUOjcP/Gk/1+FG9zdr+Vu/PGPLqU8n6KjjNxWWBJDaKJQYHC2pmlW6Gbnl3JVLPz/MNIKoKj71uUcS6W0JsaoF5NXwraJPdWWUAAADBANUg0nFVI2kCUh4k425xeQ/lNO3Z2a44J7PN/V+jIT21bgzNA+3sYJTw0QThN76YB32Fv7OSpNQy15jPDspL1HBGrgCconzJCy50HO2uUbJ0yHs3Zf+pvLlXJnYZvLWQY6W0RARZMOfO9GFHh9SiBj06k6xzFnMypGD7VwfTCgHJHHaa8Vc6YcgjUeoPqMNvo+XXgfrjsLVaCxsftmh4jqBwU90NgGrbCFRSom3fLGBiuYEC/THltbj/cnNTXIDgKwAAABphbnBjQEMwMkQyMloxTUQ2TS5ncm91cC5vbgECAwQFBgc= ssh@aws.com"
  type        = string
  description = "AWS EC2 public key data"
}