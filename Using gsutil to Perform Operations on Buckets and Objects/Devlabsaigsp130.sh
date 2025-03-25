#!/bin/bash

# Define color variables
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

# Welcome message
echo "${BLUE_TEXT}${BOLD_TEXT}=======================================${RESET_FORMAT}"
echo "${BLUE_TEXT}${BOLD_TEXT}         INITIATING EXECUTION...  ${RESET_FORMAT}"
echo "${BLUE_TEXT}${BOLD_TEXT}=======================================${RESET_FORMAT}"
echo

echo "${YELLOW_TEXT}${BOLD_TEXT}Authenticating with Google Cloud...${RESET_FORMAT}"
gcloud auth list

echo "${CYAN_TEXT}${BOLD_TEXT}Cloning Google Cloud training repository...${RESET_FORMAT}"
git clone https://github.com/GoogleCloudPlatform/training-data-analyst

echo "${MAGENTA_TEXT}${BOLD_TEXT}Navigating to the required directory...${RESET_FORMAT}"
cd training-data-analyst/blogs

PROJECT_ID=`gcloud config get-value project`
BUCKET=${PROJECT_ID}-bucket

echo "${GREEN_TEXT}${BOLD_TEXT}Creating a Cloud Storage bucket: gs://${BUCKET}${RESET_FORMAT}"
gsutil mb -c multi_regional gs://${BUCKET}

echo "${CYAN_TEXT}${BOLD_TEXT}Copying files to Cloud Storage...${RESET_FORMAT}"
gsutil -m cp -r endpointslambda gs://${BUCKET}

echo "${YELLOW_TEXT}${BOLD_TEXT}Setting public-read permissions for the bucket...${RESET_FORMAT}"
gsutil -m acl set -R -a public-read gs://${BUCKET}

echo "${MAGENTA_TEXT}${BOLD_TEXT}PLEASE CHECK YOUR PROGRESS TILL TASK 6${RESET_FORMAT}"
echo

echo "${RED_TEXT}${BOLD_TEXT}After checking your progress, press ENTER to continue...${RESET_FORMAT}"
read -n 1 -s -r -p ""

PROJECT_ID=`gcloud config get-value project` && BUCKET=${PROJECT_ID}-bucket && gsutil rm -rf gs://${BUCKET}/* && gsutil rb gs://${BUCKET}

# Completion Message
echo

echo "${GREEN_TEXT}${BOLD_TEXT}=======================================================${RESET_FORMAT}"
echo "${GREEN_TEXT}${BOLD_TEXT}              LAB COMPLETED SUCCESSFULLY!              ${RESET_FORMAT}"
echo "${GREEN_TEXT}${BOLD_TEXT}=======================================================${RESET_FORMAT}"
echo ""
echo -e "${RED_TEXT}${BOLD_TEXT}Subscribe my Channel (DevLabs.ai):${RESET_FORMAT} ${BLUE_TEXT}${BOLD_TEXT}www.youtube.com/@DevLabs.ai-369${RESET_FORMAT}"
echo
