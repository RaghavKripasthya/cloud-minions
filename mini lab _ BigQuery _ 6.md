# ✨ mini lab : BigQuery : 6

[![Lab Link](https://img.shields.io/badge/Open_Lab-Cloud_Skills_Boost-4285F4?style=for-the-badge&logo=google&logoColor=white)](https://www.youtube.com/@Arcade61432?sub_confirmation=1)
## Video Solutions[Watch Here](https://youtu.be/pk6yv29QGnA)

```bash
PROJECT_ID=$(gcloud config get-value project)
REGION="us"

gcloud iam service-accounts add-iam-policy-binding ${PROJECT_ID}@${PROJECT_ID}.iam.gserviceaccount.com \
--role='roles/iam.serviceAccountTokenCreator'

sleep 20

bq mk --transfer_config --project_id="${PROJECT_ID}" --target_dataset=ecommerce --display_name="Monthly Customer Orders Backup" --params='{"query":"SELECT * FROM `'${PROJECT_ID}'.ecommerce.customer_orders`", "destination_table_name_template":"backup_orders", "write_disposition":"WRITE_TRUNCATE"}' --data_source=scheduled_query --schedule="1 of month 00:00" --location="${REGION}"
```
</div>
---

## 🎉 **Congratulations! Lab Completed Successfully!** 

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

