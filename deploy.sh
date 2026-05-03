#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: Please provide a Google Cloud Project ID as the first argument."
  echo "Usage: ./deploy.sh YOUR_PROJECT_ID"
  exit 1
fi

gcloud config set project $1
gcloud services enable run.googleapis.com cloudbuild.googleapis.com
gcloud builds submit --config cloudbuild.yaml
gcloud run deploy electionedu --image gcr.io/$1/electionedu:latest --platform managed --region asia-south1 --allow-unauthenticated --port 8080 --memory 256Mi --min-instances 0 --max-instances 3
gcloud run services describe electionedu --platform managed --region asia-south1 --format="value(status.url)"
