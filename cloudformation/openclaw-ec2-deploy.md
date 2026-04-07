## Deploy OpenClaw on EC2 with CloudFormation + SSM

Full lab with walkthrough: [ravsau/aws-labs/openclaw-ec2-deploy](https://github.com/ravsau/aws-labs/tree/master/openclaw-ec2-deploy)

### Install SSM Session Manager Plugin (one-time)

```bash
# macOS
brew install --cask session-manager-plugin

# Linux
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" \
  -o "session-manager-plugin.deb"
sudo dpkg -i session-manager-plugin.deb
```

### Clone + Deploy

```bash
git clone https://github.com/aws-samples/sample-OpenClaw-on-AWS-with-Bedrock.git
cd sample-OpenClaw-on-AWS-with-Bedrock

aws cloudformation create-stack \
  --stack-name openclaw \
  --template-body file://clawdbot-bedrock.yaml \
  --parameters \
    ParameterKey=InstanceType,ParameterValue=t4g.small \
    ParameterKey=OpenClawModel,ParameterValue=global.anthropic.claude-haiku-4-5-20251001-v1:0 \
    ParameterKey=CreateVPCEndpoints,ParameterValue=false \
  --capabilities CAPABILITY_IAM \
  --region us-west-2

aws cloudformation wait stack-create-complete \
  --stack-name openclaw --region us-west-2
```

### Connect via SSM (no key pair, no SSH)

```bash
INSTANCE_ID=$(aws cloudformation describe-stacks \
  --stack-name openclaw \
  --query 'Stacks[0].Outputs[?OutputKey==`InstanceId`].OutputValue' \
  --output text --region us-west-2)

aws ssm start-session \
  --target $INSTANCE_ID \
  --document-name AWS-StartPortForwardingSession \
  --parameters '{"portNumber":["18789"],"localPortNumber":["18789"]}' \
  --region us-west-2
```

### Get Token + Open (new terminal)

```bash
TOKEN=$(aws ssm get-parameter \
  --name /openclaw/openclaw/gateway-token \
  --with-decryption \
  --query Parameter.Value \
  --output text --region us-west-2)

echo "http://localhost:18789/?token=$TOKEN"
```

### Switch Models

```bash
aws cloudformation update-stack \
  --stack-name openclaw \
  --template-body file://clawdbot-bedrock.yaml \
  --parameters \
    ParameterKey=InstanceType,UsePreviousValue=true \
    ParameterKey=OpenClawModel,ParameterValue=global.amazon.nova-2-lite-v1:0 \
    ParameterKey=CreateVPCEndpoints,UsePreviousValue=true \
  --capabilities CAPABILITY_IAM \
  --region us-west-2
```

### Cleanup

```bash
aws cloudformation delete-stack --stack-name openclaw --region us-west-2
```
