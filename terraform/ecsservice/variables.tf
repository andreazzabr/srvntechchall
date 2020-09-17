variable "albtg" {type=string}
variable "containerimage" {type=string}
variable "dbhost" {type = string}
variable "dbname" {type = string}
variable "dbpassword" {type = string}
variable "dbusername" {type = string}
variable "ecscluster" {type=string}
variable "ecsrole" {type=string}
variable "ecsservicedesiredcount" {type=string}
variable "ecssg" {type=string}
variable "ecssubnets" {type=list(any)}
variable "githubcred" {type=string}
variable "projectname" {type = string}
variable "taskdefinitioncpu" {type=string}
variable "taskdefinitionmem" {type=string}
variable "tasktemplate" {
    type=string
    default =""
}
variable "vpccidr" {type = string}
variable "vpcid" {type = string}