## Amazon Recognition CLI Commands
Amazon Recognition is a service that let's you perform various machine learning functions over an image/video with a simple API call. In this case, we will use the AWS CLI to work with this service


## Pre-Requisite
1) Upload some files to Amazon S3 bucket
2) Have CLI credentials set with S3 and Rekognition permissions

## Commands

1) Find Labels in an image ( I'll use image of NYC Time Square)
```console

aws rekognition detect-labels --image "S3Object={Bucket=image-rekogniton-cli,Name=times-square.jpg}"
```

2) Clean this query with only the wanted labels as output
```console

aws rekognition detect-labels --image "S3Object={Bucket=image-rekogniton-cli,Name=times-square.jpg}" --query 'Labels[].Name'
```

3)  Celebrity Detection: with Ronaldo and Messi
```console
aws rekognition recognize-celebrities --image "S3Object={Bucket=image-rekogniton-cli,Name=ronaldo.jpg}" --query 'CelebrityFaces[].Name'
```
4) Compare Messi with a lookalike
```console
aws rekognition compare-faces --source-image "S3Object={Bucket=image-rekogniton-cli,Name=messi.jpg}" --target-image "S3Object={Bucket=image-rekogniton-cli,Name=lookalike.jpg}" --query 'FaceMatches[].Similarity'
```

5) Compare Messi(Bearded) with a young Messi ( No Beard). Results are crazy accurate!


6) Video Recognition with a video of a busy city street. You'll get a JobID in return. Save this we need this for later
```console
 aws rekognition start-label-detection --video "S3Object={Bucket=image-rekogniton-cli,Name=Pedestrians.mp4}"

```

7) Get the labels from Video
```console
aws rekognition get-label-detection --job-id  206a930fce775abeed05203637342a36ced6a52d71b99e77228c1fd8fe551471 --query Labels[].Label[].[Confidence,Name]
```


8) Adult content Detection
```
aws rekognition detect-moderation-labels --source-image file:///Users/your-username/downloads/example.jpg

```
# Further Reference
https://docs.aws.amazon.com/cli/latest/reference/rekognition/index.html#cli-aws-rekognition
