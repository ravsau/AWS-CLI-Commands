You can use Environment vars to work with AWS CLI commands temporarily

- things specified in CLI command > Environment variable > AWS credential file
- For example if you have us-west-1 in AWS credential file, environment var as us-east-2 and pass --region us-east-1 in the aws cli command. the us-east-1 wins !!

## The AWS CLI supports the following environment variables:

AWS_ACCESS_KEY_ID – Specifies an AWS access key associated with an IAM user or role.

AWS_SECRET_ACCESS_KEY – Specifies the secret key associated with the access key. This is essentially the "password" for the access key.

AWS_SESSION_TOKEN – Specifies the session token value that is required if you are using temporary security credentials. For more information, see the Output section of the assume-role command in the AWS CLI Command Reference.

AWS_DEFAULT_REGION – Specifies the AWS Region to send the request to.

AWS_DEFAULT_OUTPUT – Specifies the output format to use.

AWS_DEFAULT_PROFILE – Specifies the name of the CLI profile with the credentials and options to use. This can be the name of a profile stored in a credentials or config file, or the value default to use the default profile. If you specify this environment variable, it overrides the behavior of using the profile named [default] in the configuration file.

AWS_CA_BUNDLE – Specifies the path to a certificate bundle to use for HTTPS certificate validation.

AWS_SHARED_CREDENTIALS_FILE – Specifies the location of the file that the AWS CLI uses to store access keys (the default is ~/.aws/credentials).

AWS_CONFIG_FILE – Specifies the location of the file that the AWS CLI uses to store configuration profiles (the default is ~/.aws/config).


# Reference
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html
