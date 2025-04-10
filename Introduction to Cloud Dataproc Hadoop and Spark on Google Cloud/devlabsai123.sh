#!/bin/bash

BLACK_TEXT=$'\033[0;90m'
RED_TEXT=$'\033[0;91m'
GREEN_TEXT=$'\033[0;92m'
YELLOW_TEXT=$'\033[0;93m'
BLUE_TEXT=$'\033[0;94m'
MAGENTA_TEXT=$'\033[0;95m'
CYAN_TEXT=$'\033[0;96m'
WHITE_TEXT=$'\033[0;97m'

NO_COLOR=$'\033[0m'
RESET_FORMAT=$'\033[0m'
BOLD_TEXT=$'\033[1m'
UNDERLINE_TEXT=$'\033[4m'

clear

echo "${BLUE_TEXT}${BOLD_TEXT}=======================================${RESET_FORMAT}"
echo "${BLUE_TEXT}${BOLD_TEXT}         INITIATING EXECUTION...  ${RESET_FORMAT}"
echo "${BLUE_TEXT}${BOLD_TEXT}=======================================${RESET_FORMAT}"
echo

echo -e "${YELLOW_TEXT}${BOLD_TEXT}Please enter the cluster name:${RESET_FORMAT}"
read -p "Cluster Name: " CLUSTER_NAME
export CLUSTER_NAME

echo -e "${MAGENTA_TEXT}${BOLD_TEXT}Authenticating your GCP account...${RESET_FORMAT}"
gcloud auth list

echo -e "${MAGENTA_TEXT}${BOLD_TEXT}Fetching default zone and region from project metadata...${RESET_FORMAT}"
export ZONE=$(gcloud compute project-info describe --format="value(commonInstanceMetadata.items[google-compute-default-zone])")

export REGION=$(gcloud compute project-info describe --format="value(commonInstanceMetadata.items[google-compute-default-region])")

echo -e "${MAGENTA_TEXT}${BOLD_TEXT}Fetching project number...${RESET_FORMAT}"
PROJECT_NUMBER=$(gcloud projects describe $(gcloud config get-value project) --format="value(projectNumber)")

echo -e "${MAGENTA_TEXT}${BOLD_TEXT}Adding IAM policy binding for storage admin role...${RESET_FORMAT}"
gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member="serviceAccount:$PROJECT_NUMBER-compute@developer.gserviceaccount.com" \
  --role="roles/storage.admin"

echo -e "${YELLOW_TEXT}${BOLD_TEXT}Waiting for 60 seconds to ensure IAM policy changes propagate...${RESET_FORMAT}"
sleep 60

#!/bin/bash

echo -e "${CYAN_TEXT}${BOLD_TEXT}Cluster Name:${RESET_FORMAT} $CLUSTER_NAME"
echo -e "${CYAN_TEXT}${BOLD_TEXT}Zone:${RESET_FORMAT} $ZONE"
echo -e "${CYAN_TEXT}${BOLD_TEXT}Region:${RESET_FORMAT} $REGION"

echo -e "${MAGENTA_TEXT}${BOLD_TEXT}Creating Dataproc cluster...${RESET_FORMAT}"
echo -e "${CYAN_TEXT}This may take a few minutes. Please wait.${RESET_FORMAT}"

cluster_function() {
  gcloud dataproc clusters create "$CLUSTER_NAME" \
  --region "$REGION" \
  --zone "$ZONE" \
  --master-machine-type n1-standard-2 \
  --worker-machine-type n1-standard-2 \
  --num-workers 2 \
  --worker-boot-disk-size 100 \
  --worker-boot-disk-type pd-standard \
  --no-address
}

cp_success=false

while [ "$cp_success" = false ]; do
  cluster_function
  exit_status=$?

  if [ "$exit_status" -eq 0 ]; then
  echo -e "${GREEN_TEXT}${BOLD_TEXT}Cluster created successfully!${RESET_FORMAT}"
  cp_success=true
  else
  echo -e "${RED_TEXT}${BOLD_TEXT}Cluster creation failed!${RESET_FORMAT}"

  if gcloud dataproc clusters describe "$CLUSTER_NAME" --region "$REGION" &>/dev/null; then
    echo -e "${YELLOW_TEXT}${BOLD_TEXT}Cluster already exists. Deleting it...${RESET_FORMAT}"
    gcloud dataproc clusters delete "$CLUSTER_NAME" --region "$REGION" --quiet
    echo -e "${CYAN_TEXT}Cluster deleted. Retrying in 10 seconds...${RESET_FORMAT}"
  else
    echo -e "${RED_TEXT}${BOLD_TEXT}Cluster does not exist. Retrying in 10 seconds...${RESET_FORMAT}"
  fi
  sleep 10
  fi
done

echo -e "${MAGENTA_TEXT}${BOLD_TEXT}Submitting Spark job to the cluster...${RESET_FORMAT}"
gcloud dataproc jobs submit spark \
  --project $DEVSHELL_PROJECT_ID \
  --region $REGION \
  --cluster $CLUSTER_NAME \
  --class org.apache.spark.examples.SparkPi \
  --jars file:///usr/lib/spark/examples/jars/spark-examples.jar \
  -- 1000

echo
echo "${GREEN_TEXT}${BOLD_TEXT}=======================================================${RESET_FORMAT}"
echo "${GREEN_TEXT}${BOLD_TEXT}              Finally Completed!!! Successfully        ${RESET_FORMAT}"
echo "${GREEN_TEXT}${BOLD_TEXT}=======================================================${RESET_FORMAT}"
echo

echo -e "${RED_TEXT}${BOLD_TEXT}Subscribe my Channel (DevLab.ai):${RESET_FORMAT} ${BLUE_TEXT}${BOLD_TEXT}https://www.youtube.com/channel/UCVFPYmP2CZvVmICxw7YHT8A${RESET_FORMAT}"
echo
