# AWS Spotify Data Pipeline



A serverless AWS data pipeline for collecting, storing, and querying personal Spotify listening data.



This project is being used to develop hands-on experience with AWS infrastructure, Terraform, cloud operations, security, and automation.



## Architecture



The pipeline uses AWS services to periodically retrieve Spotify data, process it, store it in Amazon S3, and make the data available for analysis with Amazon Athena.



### Current Data Flow



1. Amazon EventBridge triggers the Spotify processing Lambda on a schedule.

2. AWS Lambda communicates with the Spotify Web API to retrieve Spotify data.

3. Spotify API credentials are retrieved securely using AWS Secrets Manager.

4. Lambda processes the Spotify data and writes the resulting CSV data to Amazon S3.

5. Amazon Athena queries the data stored in S3.



### Architecture Diagram



The editable architecture diagram is available here:



`Architecture Diagram.drawio`



## AWS Services


- **AWS Lambda** - Retrieves and processes Spotify data.
- **Amazon EventBridge** - Schedules pipeline execution.
- **Amazon S3** - Stores Spotify datasets.
- **Amazon Athena** - Queries Spotify data stored in S3.
- **AWS Secrets Manager** - Stores credentials used to access the Spotify API.
- **AWS IAM** - Controls permissions between AWS resources.



## Infrastructure as Code



Terraform is used to define and manage AWS infrastructure for the project.



Terraform configuration is located in:



`terraform/`



## Repository Structure



```text

AWSSpotify-project/

├── data/          # Spotify datasets

├── lambda/        # AWS Lambda code

├── queries/       # Athena SQL queries

├── scripts/       # Local pipeline/utility scripts

├── terraform/     # AWS infrastructure defined with Terraform

├── Architecture Diagram.drawio

└── README.md

