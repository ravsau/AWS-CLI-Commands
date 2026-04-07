## AWS CLI Commands Collection

| Service | Commands |
|---------|----------|
| [CloudFormation](cloudformation/) | Deploy OpenClaw on EC2, stack management |
| [EC2](ec2/) | Instance management |
| [S3](s3/) | Bucket operations |
| [VPC](vpc/) | Network setup |
| [Lambda](lambda/) | Function management |
| [SNS](SNS/) | Notifications |
| [CloudWatch](cloudwatch/) | Monitoring |
| [Rekognition](rekognition/) | Image analysis |

---

## SNS use cases with the AWS CLI

### Send a quick SMS with the AWS CLI
```console
aws sns publish --phone-number +12012022034 --message " This is bob. My phone's dead. I'll be home soon."
```
