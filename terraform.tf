provider "aws"{
profile = "default"
shared_credentials_file = "/Users/tarandeepkaur/.aws/credentials"
region = "us-east-2"
}

resource "aws_instance" "Tarandeep_terraform_instance"{
ami = "ami-05d72852800cbf29e"
instance_type = "t2.micro"
key_name  = "Ansiblekey01"
}
