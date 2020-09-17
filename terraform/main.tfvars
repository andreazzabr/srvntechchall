


#############  change these to authenticate with github #############
githubsecr ={
    username = "aaaaa@bbb.com"   #email account used on github
    password = "11111111111111"  #github token to read repositories
}
####################################################################



#variables for Infra
projectname = "srvntchall"
region = "ap-southeast-2"
vpccidr = "10.0.0.0/16"
publicsubnets = [
  {
    name = "public-a"
    cidr = "10.0.10.0/24"
    az   = "ap-southeast-2a"
    publicip = true
  },
  {
    name = "public-b"
    cidr = "10.0.11.0/24"
    az   = "ap-southeast-2b"
    publicip = true
  }
]
privatesubnets = [
  {
    name = "private-a"
    cidr = "10.0.20.0/24"
    az = "ap-southeast-2a"
    publicip = false
  },
  {
    name = "private-b"
    cidr = "10.0.21.0/24"
    az = "ap-southeast-2b"
    publicip = false
  }
]
dbchangeapplyimmediately = true
dbengine = "postgres"
dbengineversion = "10.7"
dbhost = ""
dbname = "app"
dbpassword = ""
dbusername = "postgres"
dnshosts = true
instanceclass = "db.t2.micro"
skipfinalsnapshot = true
storageencrypted = false


#variables for ECS Service

#servian github account was not working when I wrote this code ## containerimage = "docker.pkg.github.com/servian/techchallengeapp/techchallengeapp:latest"
containerimage = "docker.pkg.github.com/andreazzabr/srvntechchall/techchallengeapp:latest"
albtg = ""
ecscluster = ""
ecsrole = ""
ecsservicedesiredcount = "2"
ecssg = ""
ecssubnets = [""]
githubcred = ""
recoverywindow = "0"
taskdefinitioncpu = "256"
taskdefinitionmem = "512"
