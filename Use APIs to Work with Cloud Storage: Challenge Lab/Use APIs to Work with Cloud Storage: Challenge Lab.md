

### Use APIs to Work with Cloud Storage: Challenge Lab


```

curl -LO https://raw.githubusercontent.com/RaghavKripasthya/cloud-minions/refs/heads/main/Use%20APIs%20to%20Work%20with%20Cloud%20Storage%3A%20Challenge%20Lab/devlabsarc125.sh

sudo chmod +x devlabsarc125.sh
./devlabsarc125.sh
```
## If Task 1 didnt Exceute copy this commands and exceute!!

```
TASK 1 :

# Create bucket1.json
cat > bucket1.json <<EOF
{  
   "name": "$DEVSHELL_PROJECT_ID-bucket-1",
   "location": "us",
   "storageClass": "multi_regional"
}
EOF


# Create bucket1
curl -X POST -H "Authorization: Bearer $(gcloud auth print-access-token)" -H "Content-Type: application/json" --data-binary @bucket1.json "https://storage.googleapis.com/storage/v1/b?project=$DEVSHELL_PROJECT_ID"


# Create bucket2.json
cat > bucket2.json <<EOF
{  
   "name": "$DEVSHELL_PROJECT_ID-bucket-2",
   "location": "us",
   "storageClass": "multi_regional"
}
EOF


# Create bucket2
curl -X POST -H "Authorization: Bearer $(gcloud auth print-access-token)" -H "Content-Type: application/json" --data-binary @bucket2.json "https://storage.googleapis.com/storage/v1/b?project=$DEVSHELL_PROJECT_ID"


```

<div align="center" style="padding: 5px;">
  <h3>📱 Join the DevLabs.ai Community</h3>
  
  <a href="https://chat.whatsapp.com/BeGG0HXiM469i3WFMgm4qs">
    <img src="https://img.shields.io/badge/Join_WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white" alt="Join WhatsApp">
  </a>
  &nbsp;
  <a href="https://www.youtube.com/channel/UCVFPYmP2CZvVmICxw7YHT8A">
    <img src="https://img.shields.io/badge/Subscribe-Devlabs%20ai-FF0000?style=for-the-badge&logo=youtube&logoColor=white" alt="YouTube Channel">
  </a>
  &nbsp;
  <a href="https://t.me/DevLabsai">
    <img src="https://img.shields.io/badge/DevLabsai-chats%20&Updates-0077B5?style=for-the-badge&logo=Telegram&logoColor=white" alt="Telegram">
</a>


</div>

