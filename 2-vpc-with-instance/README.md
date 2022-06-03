# How to test this config

Note: This configuration depends on the VPC in 1-vpc. You can comment out the data blocks and swap out the vpc_ids and subnet_ids to use your own VPC configuration if you'd like.

1. Run terraform init & apply
2. Pick one of the public IPs from the output and run:
    ```shell
    $ ssh -i private_key.pem ec2-user@<IP>
    ```
3. Running this from the public instance should give you a similar output:
    ```shell
    $ curl <private IP>
    <center><h1>This instance is in the subnet wih ID: subnet-077fb3ca7bdafc81e </h1></center>
    ```