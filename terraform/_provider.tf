provider "aws" {
  version = "~> 3.0"
  region = "ap-southeast-2"
}
provider "random" {
  version = "2.2.1"
}
provider "template" {
  version = "~>2.1.2"  
}