import json
# type: ignore
import boto3

def lambda_handler(event, context):
    # Connect to DynamoDB
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('lambda-data-table')  # same name as your var.dynamodb_table_name

    # Example: Write a sample item to DynamoDB
    table.put_item(
        Item={
            'id': '001',
            'message': 'Hello from Lambda!'
        }
    )

    return {
        'statusCode': 200,
        'body': json.dumps('Data inserted successfully!')
    }
