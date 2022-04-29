# base setup variables
environment = "dev"
account_id  = ""#AWS account ID here for dev eg: "512524563914"
main_vpc    = ""#Main deployed VPC here eg: "VPC-eu-west-2-prod-01"


default_tags = {
  project : "ams",
  createdBy : "terraform",
  team : "atoscerebro",
  environment : "sand"
}

