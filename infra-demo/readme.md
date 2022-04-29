Demo repo for standing up a nano EC2 with a very basic web site. Public IP address is provided as a TF output. THis was originally put together for a very quick demo and so built on existing infrastructure - therefore there are pre-reqs:

1. A VPC with public and private subnets (which are tagged with a name containing public/private)
2. VPC has an internet gateway
3. default security group has a rule allowing traffic on port 80 from a desired source ip - suggest as limited as possible. Avoid using default SG outside of this demo.
4. an S3 bucket to store the remote state (make sure public access is blocked)
5. a dynamo db table with the following setup:
   - Partition key = LockID
   - set up as capacity mode: on demand - on the console, create new table, select customise settings, then 'on demand' in the read-write capacity settings section. All other defaults are fine.

The code is set up for multiple environment deployment - so there are seperate tfvars (variable values) and remote backend configurations. These are stored in the 'config' directory.
To save having to define the path to the right tfvars (and backend) every time a TF command is run, shortcut commands are defined in the makefile.
- make init = terraform init (with appropriate back end config)
- make plan = terraform plan (with path to correct TFVARs)
- etc. 

Before running, set an environment variable called ENVIRONMENT to point at the set of config you want to use:

```
export ENVIRONMENT=dev
make init
make plan
```

Also need to put in the following values for the prereqs in the environment config files that are in use:

dev-backend.conf
```
bucket         = ""# bucket name here - create this first in other TF/manually: The machine running TF will need rights on this bucket. eg:"ams-tfstate-sand-56ki3n3j329k"
key            = "infra-demo-tf"# state file name here - will be created on first init "ams-sand-data"
region         = "eu-west-2"
dynamodb_table = ""# dynamo db table name here - create this first in other TF/manually The machine running TF will need rights on this db. eg:"cerebro-tfstatelock"
```
dev.tfvars
```
account_id  = ""#AWS account ID here for dev eg: "512524563914"
main_vpc    = ""#Main deployed VPC here eg: "VPC-eu-west-2-prod-01" this is the name of the VPC that contains the public subnet that you want to deploy the server to. 
```

Remember to authenticate to AWS before starting:
```
export AWS_ACCESS_KEY_ID="***"
export AWS_SECRET_ACCESS_KEY="***"
```

