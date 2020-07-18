import boto3

ec2 = boto3.client('ec2')

def listEC2(event, context):

     custom_filter = []

     for tagName in event :
         filterMap = {'Name':'tag:' + tagName, 'Values': [event[tagName]]}
         custom_filter.append(filterMap)
     response = ec2.describe_instances(Filters=custom_filter)

     #return json.dumps(response["Reservations"], default = myconverter)
     return response.__str__()
