# Deploy 2 buckets and website in aws

This repository contains the terraform files to deploy 2 aws s3 buckets 
and a website associated to one of this two buckets according to the 
requirements below.

## How to deploy this infrastructure:

### Prerequisites:

- The Terraform CLI (1.2.0+) installed.
- The AWS CLI installed.
- AWS account and associated credentials that allow you to create resources.
  - More info: https://aws.amazon.com/free
  - Credentials: https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html

Export your credentials to deploy resources in aws:

```
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

### Deployment

Move to development folder and simply type `terraform apply`.

NOTE: This is not the recomended way to deploy infrastructure, ideally the
infrastructure should not be deployed by humans, rather applications with
limited permissions to their scope. The infrastructure should be deployed 
inside of a development workflow as any other code using the CI/CD concept and 
only after proper testing and review.

# Considerations

1. I have decided to use AWS instead of Azure (The cloud I use at my current
   job) mainly because I wanted to showcase one of my 
   strengths, which is learning fast. The second reason is that I feel excited
   to try a different cloud provider. Even if I'm confident that what has 
   been delivered is what is expected **there may be some issues precisely 
   because I'm not as familiar with AWS than with Azure**, I apologize in 
   advance and hope you can understand. I will appreciate any feedback you can
   give to me ;)

2. I have assumed few things based on the requirements:

  - Over the 2 different buckets that are required the website should be 
    deployed only on one of them.

  - "Enabled bucket" means that the objects on the bucket are versioned.
  
  - Since the buckets are private, I have assumed that the DNS on which the
    website is exposed is on a virtual private network. Not exposed to the 
    whole internet

3. For the development methodology, I have used something similar to the
   feature branch workflow. You can take a look at the branches in the 
   repository (that I have not deleted in this case), the issues and the 
   pull requests (that I merged myself because I'm working alone for this 
   test).

# Set remote state file locking

```
terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
```

More info: https://developer.hashicorp.com/terraform/language/settings/backends/s3

---
# Assigment

Build a simple Static website on AWS (or GCP, Azure if you feel more 
comfortable with those cloud providers)

## Requirements

1. Create 2 S3 buckets (1 for source, 1 for assets) with 3 dummy objects in 
each of them

2. Buckets
  a. Private
  b. Encrypted
  c. Enabled
  d. Policy enabled (non current objects to expire after 30d

3. Website to be accessed with the following name https://web.mycardo.com&#39; 
   using CDN - Create/use any AWS services needed

4. Use TF v 1.4.6

5. Use TF AWS provider 4.67.0

6. Use your own module(s) - not public

7. DRY Code

8. (Set remote state file locking) - Just provide the steps required and a 
dummy TF snippet
