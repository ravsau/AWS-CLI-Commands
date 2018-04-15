#! /bin/bash
elblist=`aws elb describe-load-balancers --query LoadBalancerDescriptions[].LoadBalancerName  --output text`

aws elb describe-tags --load-balancer-name $elblist  
