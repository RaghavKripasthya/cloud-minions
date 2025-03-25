# ✨ mini lab : BigQuery : 5

[![Lab Link](https://img.shields.io/badge/Open_Lab-Cloud_Skills_Boost-4285F4?style=for-the-badge&logo=google&logoColor=white)](https://www.youtube.com/@Arcade61432?sub_confirmation=1)

## Video Solutions[]()
```bash
PROJECT_ID=$(gcloud config get-value project)

bq load --autodetect --source_format=CSV customer_details.customers customers.csv

bq query --use_legacy_sql=false 'CREATE OR REPLACE TABLE customer_details.male_customers AS SELECT CustomerID, Gender FROM customer_details.customers WHERE Gender = "Male"'

bq extract --destination_format=CSV customer_details.male_customers gs://${PROJECT_ID}-bucket/exported_male_customers.csv 
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

