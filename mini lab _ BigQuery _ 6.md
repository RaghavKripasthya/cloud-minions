# ✨ mini lab : BigQuery : 6

[![Lab Link](https://img.shields.io/badge/Open_Lab-Cloud_Skills_Boost-4285F4?style=for-the-badge&logo=google&logoColor=white)](https://www.youtube.com/@Arcade61432?sub_confirmation=1)

---

## ⚠️ Disclaimer

<div style="padding: 15px; margin-bottom: 20px;">
<p><strong>Educational Purpose Only:</strong> This script and guide are intended solely for educational purposes to help you understand Google Cloud monitoring services and advance your cloud skills. Before using, please review it carefully to become familiar with the services involved.</p>

<p><strong>Terms Compliance:</strong> Always ensure compliance with Qwiklabs' terms of service and YouTube's community guidelines. The aim is to enhance your learning experience—not to circumvent it.</p>
</div>

---

## ⚙️ Lab Environment Setup

<div style="padding: 15px; margin: 10px 0;">
<p><strong>☁️ Run in Terminal:</strong></p>

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

## 🎉 **Congratulations! Lab Completed Successfully!** 🏆  

<div align="center" style="padding: 5px;">
  <h3>📱 Join the Arcade Crew Community</h3>
  
  <a href="https://chat.whatsapp.com/KkNEauOhBQXHdVcmqIlv9F">
    <img src="https://img.shields.io/badge/Join_WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white" alt="Join WhatsApp">
  </a>
  &nbsp;
  <a href="https://www.youtube.com/@Arcade61432?sub_confirmation=1">
    <img src="https://img.shields.io/badge/Subscribe-Arcade%20Crew-FF0000?style=for-the-badge&logo=youtube&logoColor=white" alt="YouTube Channel">
  </a>
  &nbsp;
  <a href="https://www.linkedin.com/in/gourav61432/">
    <img src="https://img.shields.io/badge/LINKEDIN-Gourav%20Sen-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn">
</a>


</div>

---

<div align="center">
  <p style="font-size: 12px; color: #586069;">
    <em>This guide is provided for educational purposes. Always follow Qwiklabs terms of service and YouTube's community guidelines.</em>
  </p>
  <p style="font-size: 12px; color: #586069;">
    <em>Last updated: March 2025</em>
  </p>
</div>
