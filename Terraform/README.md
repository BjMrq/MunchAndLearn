# Terraform 

### Architecture as code


## Objectives 🎯

- Understand what is architecture as code and it's fundamentals
- Understand how we can use Terraform to deploy infrastructure
- Understand Terraform workflow and Terraform Cloud


## Infrastructure

What does our code needs to run? It needs a machine, depending of how our code is written it needs a particular environment probably some dependencies. Once our code is able to run how can we serve it to our users? We need something that can get a request and direct it to the right place so we need an other piece of application that can do that, a web server, maybe a load balancer as well.

And once we get all of those and we are able to redirect a user request to our application we need to configure all of it, set the right load balancing rules, and then maintain it, be able to do this all over if we add a new service to our system.

All of this this is part of the infrastructure needed for our user to access our system. 

And this infrastructure and the way we deploy applications as evolve quite a lot those last 10 years:
- We now use use cloud environment wish as revolutionized and improved the way we design, develop, and maintain IT infrastructure
- The life spawn of system is much shorter instead of months to years, it's now days to weeks in terms of how long a resource might live.
- Architecture as changed a lot as well going from big monolith apps to something more microservice oriented Instead of one large instances, we might have many smaller instances, so there are many more things we need to provision

> How can we operation this in a way that's reliable and robust, and not prone to human error?

By capturing our infrastructure in a codified way


## As code

Infrastructure as code or IaC is the response of the question how do we take this infrastructure provisioning and managing and how do we take that and capture that in a codified way.

Having our infrastructure as code we can capture it's state, we can also check it into version control. Now we can see an incremental history of parts of our infrastructure as well who changed what and for what reasons. We now how is our infrastructure is actually defined at any given point of time, and we have this transparency of documentation that we lack in a traditional point-and-click environment. And we can also automate around it, if it is just code we can trigger it at any given moment, and connect it to other code or script running.

Because of such automation, it’s possible to control and manipulate the available resources programmatically by interacting with the cloud providers. This way, infrastructure changes can be implemented more quickly and reliably and operated mostly without manual interaction, but still with the ability to oversee the whole process and revert changes if something does not go according to plan.

>Infrastructure as Code is the approach of automating infrastructure deployment and changes by defining the desired resource states and their mutual relationships in code.

The main benefits of IaC are:

- **Deployment**: removing the manual provisioning interaction with cloud providers means a quicker deployment speed.
- **Consistency**: deploying resources are the same each time, resolving infrastructure fragility.
- **Modification**: modifying resources can have a quick turnaround time.
- **Reusability**: reusing parts of the infrastructure architecture in future projects.
- **Version Control**: storing the infrastructure code in version control systems.
- **Visibility**: writing configuration as code acts as documentation for the infrastructure.


## Terraform 

Terraform is an open source IaC resource provisioning tool, written in Go and developed by Hashicorp. It supports multiple cloud providers, including AWS. The infrastructure definitions are written in the Hashicorp Configuration Language (HCL) or since recently in Typescript.

Terraform works by reading the code describing your infrastructure and generating a graph containing all resources with their mutual relationships. It then compares it to the state of the resources it holds, and prepares an execution plan that details what will be applied to the cloud, and in what order, to reach the desired state, then it apply those modifications and update the states it holds.

- State
- Read
- Plan
- Apply 
- State

## Flow 

Let's deploy a static application into a s3 bucket served by a cloudfront distribution

### Terraform
We first need to deploy the infrastructure needed to serve our application, let's do it with terraform

#### Init Backend
Terraform need to keep track of the "state" of our system, it does it in a state file that can be in different places, terraform cloud or a s3 bucket or on local environment (in this example simply local environment, but not recommended if working with others)
```
terraform init
```
Notice the new ```.terraform``` folder that also contain our state file

#### Plan
When we run a plan command, Terraform first refresh our state and then determines what actions are necessary to achieve the desired state specified in the configuration files.
This command is a convenient way to check whether the execution plan for a set of changes matches our expectations without making any changes to real resources or to the state. 

```
terraform plan" 
```

#### Apply 
When we run the apply command we want to apply the changes required to reach the desired state of our configuration files, or the pre-determined set of actions generated by the previously run plan command
```
terraform apply 
```
Notice the state file located in ```.terraform``` has been updated with our new state


### Application
Now that our infrastructure is ready we can build our application and sync the content in the s3 bucket
#### Build
In your application run the appropriate build command
```
npm run build
```

#### Deploy 
Deploy the builded application (in build folder) in the s3 bucket
```
aws s3 sync build s3://wiki-app-dev
```