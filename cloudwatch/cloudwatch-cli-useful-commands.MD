

## get-metric-statistics

Gets statistics for the specified metric.

The maximum number of data points returned from a single call is 1,440. If you request more than 1,440 data points, CloudWatch returns an error. To reduce the number of data points, you can narrow the specified time range and make multiple requests across adjacent time ranges, or you can increase the specified period. Data points are not returned in chronological order.

## Amazon CloudWatch retains metric data as follows:

- Data points with a period of less than 60 seconds are available for 3 hours. These data points are high-resolution metrics and are available only for custom metrics that have been defined with a StorageResolution of 1.
- Data points with a period of 60 seconds (1-minute) are available for 15 days.
- Data points with a period of 300 seconds (5-minute) are available for 63 days.
- Data points with a period of 3600 seconds (1 hour) are available for 455 days (15 months).


This command will return

```
aws cloudwatch get-metric-statistics --metric-name CPUUtilization --start-time 2018-06-01T23:18:00Z --end-time 2018-06-19T23:18:00Z --period 3600 --namespace AWS/EC2 --statistics Average --dimensions Name=InstanceId,Value=i-07442b7dca24a5740
```

```json
       "Timestamp": "2018-06-04T20:15:00Z", 
            "Average": 8.612647031582847, 
            "Unit": "Percent"
        }, 
        {
            "Timestamp": "2018-06-18T14:15:00Z", 
            "Average": 8.627103207681818, 
            "Unit": "Percent"
        }, 
        
        {
            "Timestamp": "2018-06-15T19:15:00Z", 
            "Average": 9.349541539316677, 
            "Unit": "Percent"
        }, 
       
        {
            "Timestamp": "2018-06-05T10:15:00Z", 
            "Average": 9.144206724089889, 
            "Unit": "Percent"
        }, 
        {
            "Timestamp": "2018-06-08T17:15:00Z", 
            "Average": 10.231900836651965, 
            "Unit": "Percent"
        }, 
        {
            "Timestamp": "2018-06-11T11:15:00Z", 
            "Average": 9.000470809792224, 
            "Unit": "Percent"
        }, 
        {
            "Timestamp": "2018-06-08T04:15:00Z", 
            "Average": 12.447770985768054, 
            "Unit": "Percent"
        }
    ], 
    "Label": "CPUUtilization"
    }
    
 ```
To get the max CPU Utilization use this command:

```
aws cloudwatch get-metric-statistics --metric-name CPUUtilization --start-time 2018-06-01T23:18:00Z --end-time 2018-06-19T23:18:00Z --period 3600 --namespace AWS/EC2 --statistics Maximum --dimensions Name=InstanceId,Value=i-07442b7dca24a5740
```

```json
      {
            "Timestamp": "2018-06-18T00:15:00Z", 
            "Maximum": 28.3333333333455, 
            "Unit": "Percent"
        }, 
        {
            "Timestamp": "2018-06-05T10:15:00Z", 
            "Maximum": 30.5084745762589, 
            "Unit": "Percent"
        }, 
        {
            "Timestamp": "2018-06-08T17:15:00Z", 
            "Maximum": 29.9999999999879, 
            "Unit": "Percent"
        }, 
        {
            "Timestamp": "2018-06-11T11:15:00Z", 
            "Maximum": 28.3333333333455, 
            "Unit": "Percent"
        }, 
        {
            "Timestamp": "2018-06-08T04:15:00Z", 
            "Maximum": 100.0, 
            "Unit": "Percent"
        }
    ], 
    "Label": "CPUUtilization"
```

