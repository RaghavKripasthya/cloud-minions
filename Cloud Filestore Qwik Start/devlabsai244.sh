#!/bin/bash

# Define text colors and formatting
BLACK_TEXT=$'\033[0;90m'
RED_TEXT=$'\033[0;91m'
GREEN_TEXT=$'\033[0;92m'
YELLOW_TEXT=$'\033[0;93m'
BLUE_TEXT=$'\033[0;94m'
MAGENTA_TEXT=$'\033[0;95m'
CYAN_TEXT=$'\033[0;96m'
WHITE_TEXT=$'\033[0;97m'

RESET_FORMAT=$'\033[0m'
BOLD_TEXT=$'\033[1m'
UNDERLINE_TEXT=$'\033[4m'
clear # Clear the terminal screen

# --- Script Header ---
echo
echo "${BLUE_TEXT}${BOLD_TEXT}=======================================${RESET_FORMAT}"
echo "${BLUE_TEXT}${BOLD_TEXT}         STARTING EXECUTION...       ${RESET_FORMAT}"
echo "${BLUE_TEXT}${BOLD_TEXT}=======================================${RESET_FORMAT}"
echo

echo -n "${YELLOW_TEXT}${BOLD_TEXT}Please enter the zone: ${RESET_FORMAT}"
read ZONE
export ZONE

# Enable the required API
echo "${GREEN_TEXT}${BOLD_TEXT}Enabling the Filestore API...${RESET_FORMAT}"
gcloud services enable file.googleapis.com

# Create a Compute Engine instance
echo "${GREEN_TEXT}${BOLD_TEXT}Creating a Compute Engine instance named 'nfs-client'...${RESET_FORMAT}"
gcloud compute instances create nfs-client \
--project=$DEVSHELL_PROJECT_ID --zone=$ZONE --machine-type=e2-medium \
--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
--metadata=enable-oslogin=true \
--maintenance-policy=MIGRATE \
--provisioning-model=STANDARD \
--scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server \
--create-disk=auto-delete=yes,boot=yes,device-name=nfs-client,image=projects/debian-cloud/global/images/debian-11-bullseye-v20231010,mode=rw,size=10,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE/diskTypes/pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=goog-ec-src=vm_add-gcloud --reservation-affinity=any

# Create a Filestore instance
echo "${GREEN_TEXT}${BOLD_TEXT}Creating a Filestore instance named 'nfs-server'...${RESET_FORMAT}"
gcloud filestore instances create nfs-server \
--zone=$ZONE --tier=BASIC_HDD \
--file-share=name="vol1",capacity=1TB \
--network=name="default"

# Final message
echo -e "${RED_TEXT}${BOLD_TEXT}Subscribe my Channel (Devlabs.ai):${RESET_FORMAT} ${BLUE_TEXT}${BOLD_TEXT}https://www.youtube.com/channel/UCVFPYmP2CZvVmICxw7YHT8A${RESET_FORMAT}"
echo
