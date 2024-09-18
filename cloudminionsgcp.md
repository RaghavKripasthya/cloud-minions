

## 💡 Lab Link: [Develop GenAI Apps with Gemini and Streamlit: Challenge Lab - GSP517](https://www.cloudskillsboost.google/focuses/87315?parent=catalog)

## 🚀 Lab Solution [Watch Here](https://www.youtube.com/channel/UCVFPYmP2CZvVmICxw7YHT8A)

---

## 🚀 [First open in the new tab and download the file](https://github.com/Techcps/GSP/blob/main/Develop%20GenAI%20Apps%20with%20Gemini%20and%20Streamlit%3A%20Challenge%20Lab/prompt.ipynb)

---

## 🚨Export the REGION name correctly:

```
export REGION=
```

## 🚨Copy and run the below commands in Cloud Shell:

```

gcloud services enable run.googleapis.com --project $DEVSHELL_PROJECT_ID

git clone https://github.com/GoogleCloudPlatform/generative-ai.git

cd generative-ai/gemini/sample-apps/gemini-streamlit-cloudrun

gsutil cp gs://spls/gsp517/chef.py .

rm -rf Dockerfile chef.py

wget https://raw.githubusercontent.com/Techcps/GSP/master/Develop%20GenAI%20Apps%20with%20Gemini%20and%20Streamlit%3A%20Challenge%20Lab/Dockerfile.txt

wget https://raw.githubusercontent.com/Techcps/GSP/master/Develop%20GenAI%20Apps%20with%20Gemini%20and%20Streamlit%3A%20Challenge%20Lab/chef.py

mv Dockerfile.txt Dockerfile

gcloud storage cp chef.py gs://$DEVSHELL_PROJECT_ID-generative-ai/

# Set the python virtual environment and install the dependencies
python3 -m venv gemini-streamlit
source gemini-streamlit/bin/activate
python3 -m  pip install -r requirements.txt


# Set environment variables for project id
export PROJECT=$DEVSHELL_PROJECT_ID


# Run the chef.py application
streamlit run chef.py \
  --browser.serverAddress=localhost \
  --server.enableCORS=false \
  --server.enableXsrfProtection=false \
  --server.port 8080
```

## Click on the link & Test the app from video instructions

## Press Ctrl+c for terminate the script.

---

```
AR_REPO='chef-repo'
SERVICE_NAME='chef-streamlit-app'

gcloud artifacts repositories create "$AR_REPO" --repository-format=Docker --location="$REGION"
sleep 10
gcloud builds submit --tag "$REGION-docker.pkg.dev/$PROJECT/$AR_REPO/$SERVICE_NAME"


gcloud run deploy "$SERVICE_NAME" \
  --port=8080 \
  --image="$REGION-docker.pkg.dev/$PROJECT/$AR_REPO/$SERVICE_NAME" \
  --allow-unauthenticated \
  --region=$REGION \
  --platform=managed  \
  --project=$PROJECT \
  --set-env-vars=GCP_PROJECT=$PROJECT,GCP_REGION=$REGION
```
---

## 🚨 Click on the link & Test the app from video instructions
---


### Congratulations, you're all done with the lab 😄

---

### 🌐 Join our Community

- **Please like share & subscribe to [CloudMinionsGCP](https://www.youtube.com/channel/UCVFPYmP2CZvVmICxw7YHT8A)** <img src="https://github.com/user-attachments/assets/6ee41001-c795-467c-8d96-06b56c246b9c" alt="icon" width="25" height="25">
### Thanks for watching and stay connected :)

---

### 🚨NOTE: copyright by Google Cloud
- **This script doesn't belong to this page, it has been edited and shared for the purpose of Educational. DM for credit or removal request (no copyright intended) ©All rights and credits for the original content belong to Google Cloud.**
- **Credit to the respective owner [Google Cloud Skill Boost website](https://www.cloudskillsboost.google/)** 🙏

---
