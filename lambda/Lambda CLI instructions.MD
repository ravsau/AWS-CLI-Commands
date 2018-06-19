

## Create a Lambda function with the AWS CLI to stop EC2 Instances:


### Steps:
1. make a file with a python code (stop-ec2.py ).  **Stop-ec2.py is included in the same folder as this file
2. zip -r lambda stop.py
3. Create a lambda function  (handler should be filename.handlerfunctionname)



###  Find the role to use:
```
aws iam list-roles
```

### Create a lambda function
```
aws lambda create-function --function-name CLI-lambda-test --runtime python2.7 --role arn:aws:iam::771452637355:role/lambda_full --handler stop.lambda_handler --zip-file fileb://lambda.zip
```

### Run 3 instances with this command that we will stop later:

``` 
aws ec2 run-instances --image-id ami-6057e21a --instance-type t2.micro --count 3
```



### Invoke the function Asynchronously:

``` 
aws lambda invoke --invocation-type Event --function-name CLI-lambda-test output.txt
```



### Alternately invoke synchronously with

``` 
aws lambda invoke --invocation-type RequestResponse --function-name CLI-lambda-test output.txt
```


If you need to pass certain values pass them like this :

```
--payload '{"key1":"value1", "key2":"value2", "key3":"value3"}'
```

