EC2 CLI

More Reference:http://docs.aws.amazon.com/cli/latest/reference/ec2/index.html#cli-aws-ec2



List Instances:

```console
aws ec2 describe-instances
aws ec2 describe-instances --output text
aws ec2 describe-instances --output json
aws ec2 describe-instances --output table

```


List only few things like a dashboard:

```console
aws ec2 describe-instances --query 'Reservations[].Instances[].[Placement.AvailabilityZone, State.Name, InstanceId, InstanceType,VpcId,SubnetId,ImageId,Tags[?Key==`Name`].Value|[0]]'
```



Create a key pair and output that to a file:
```console
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem
```


*After that make sure to chmod 400 MyKeyPair file.


Create an instance:
```console
aws ec2 run-instances --image-id ami-8c1be5f6 --instance-type t2.micro --key-name MyKeyPair 
```


This will create an instance in the default VPC. Specify the subnet name and the right security groups within that VPC if you want to be specific.


Create an instance in an specific subnet:
```console
aws ec2 run-instances --image-id ami-8c1be5f6 --instance-type t2.micro --key-name MyKeyPair --security-group-ids sg-beb3eacc --subnet-id subnet-ed36c3c2
```


If needed change the ingress of a security group:
```console
aws ec2 authorize-security-group-ingress --group-id sg-814134f2 --protocol tcp --port 22 --cidr 0.0.0.0/0
```


Terminate 1 or multiple ec2s at once :
```console
aws ec2 terminate-instances --instance-ids i-0b20d7680fa0e6ba0  i-00251da28fa34ffd1
```



Describe and filter to show only windows Instance( use of filter switch )

```console
aws ec2 describe-instances --query 'Reservations[].Instances[].PublicIpAddress' --filters "Name=platform,Values=windows"

```




