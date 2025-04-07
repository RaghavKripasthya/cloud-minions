
## Ingesting FHIR Data with the Healthcare API || GSP457 ||

### Video Solutions[watch Here]()

```
curl -LO raw.githubusercontent.com/RaghavKripasthya/cloud-minions/main/Ingesting%20FHIR%20Data%20with%20the%20Healthcare%20API/devlabsai457.sh

sudo chmod +x devlabsai457.sh

./devlabsai457.sh
```

### Now Follow The Lab Video Instructions!!


```bash
gcloud healthcare fhir-stores export bq de_id \
  --dataset=$DATASET_ID \
  --location=$LOCATION \
  --bq-dataset=bq://$PROJECT_ID.de_id \
  --schema-type=analytics
```


### OPEN BigQuery 

    ```sql
    SELECT
      id AS patient_id,
      name[safe_offset(0)].given AS given_name,
      name[safe_offset(0)].family AS family,
      birthDate AS birth_date
    FROM dataset1.Patient
    LIMIT 10;
    ```
 **Run** the query to see the results.

## Congratulations!!👇🏼👇🏼👇🏼👇🏼⬇️😊❤️
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

