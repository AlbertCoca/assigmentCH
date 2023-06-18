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
