#!/bin/bash
BLACK_TEXT=$'\033[0;90m'
RED_TEXT=$'\033[0;91m'
GREEN_TEXT=$'\033[0;92m'
YELLOW_TEXT=$'\033[0;93m'
BLUE_TEXT=$'\033[0;94m'
MAGENTA_TEXT=$'\033[0;95m'
CYAN_TEXT=$'\033[0;96m'
WHITE_TEXT=$'\033[0;97m'
DIM_TEXT=$'\033[2m'
STRIKETHROUGH_TEXT=$'\033[9m'
BOLD_TEXT=$'\033[1m'
RESET_FORMAT=$'\033[0m'

clear

echo
echo "${CYAN_TEXT}${BOLD_TEXT}===================================${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}     Starting EXECUTION            ${RESET_FORMAT}"
echo "${CYAN_TEXT}${BOLD_TEXT}===================================${RESET_FORMAT}"
echo

echo "${YELLOW_TEXT}${BOLD_TEXT} Checking your default region...${RESET_FORMAT}"
echo

export REGION=$(gcloud compute project-info describe \
--format="value(commonInstanceMetadata.items[google-compute-default-region])")

echo "${BLUE_TEXT}${BOLD_TEXT} Your default region is set to: ${REGION}${RESET_FORMAT}"

echo
echo "${GREEN_TEXT}${BOLD_TEXT}Cloning the Terraform Load Balancer example repository...${RESET_FORMAT}"
echo

git clone https://github.com/GoogleCloudPlatform/terraform-google-lb
cd ~/terraform-google-lb/examples/basic

echo "${CYAN_TEXT}${BOLD_TEXT} Fetching your active Google Cloud project ID...${RESET_FORMAT}"
echo

export GOOGLE_PROJECT=$(gcloud config get-value project)

echo "${MAGENTA_TEXT}${BOLD_TEXT}💼 Your active project ID is: ${GOOGLE_PROJECT}${RESET_FORMAT}"

echo
echo "${MAGENTA_TEXT}${BOLD_TEXT}📝 Updating region in Terraform variables to: ${REGION}${RESET_FORMAT}"
echo

sed -i 's/us-central1/'"$REGION"'/g' variables.tf

echo "${BLUE_TEXT}${BOLD_TEXT}🌐 Setting your project ID for Terraform...${RESET_FORMAT}"
echo

export TF_VAR_project_id=$DEVSHELL_PROJECT_ID

echo "${YELLOW_TEXT}${BOLD_TEXT}⚙️ Initializing Terraform in the current directory...${RESET_FORMAT}"
echo

terraform init

echo "${GREEN_TEXT}${BOLD_TEXT}🔎 Planning your Terraform deployment...${RESET_FORMAT}"
echo

terraform plan

echo "${RED_TEXT}${BOLD_TEXT}🚦 Applying your Terraform configuration. This may take a few moments...${RESET_FORMAT}"
echo

yes | terraform apply --auto-approve

echo
echo "${MAGENTA_TEXT}${BOLD_TEXT}💖 IF YOU FOUND THIS HELPFUL, SUBSCRIBE DevLabs.Ai For More! 👇${RESET_FORMAT}"
echo "${BLUE_TEXT}${BOLD_TEXT}${UNDERLINE_TEXT}https://www.youtube.com/channel/UCVFPYmP2CZvVmICxw7YHT8A${RESET_FORMAT}"
echo
