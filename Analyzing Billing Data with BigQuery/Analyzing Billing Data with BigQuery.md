# Analyzing Billing Data with BigQuery || [GSP621](https://www.cloudskillsboost.google/focuses/7114?parent=catalog) ||

## Solution [here](https://youtu.be/mL6mWQchn4M)


```
curl -LO raw.githubusercontent.com/RaghavKripasthya/cloud-minions/main/Analyzing%20Billing%20Data%20with%20BigQuery/gsp621.sh

sudo chmod +x gsp621.sh

./gsp621.sh
```

* Go to **BigQuery** from [here](https://console.cloud.google.com/bigquery?)

```
SELECT CONCAT(service.description, ' : ',sku.description) as Line_Item FROM `billing_dataset.enterprise_billing` GROUP BY 1
```
```
SELECT CONCAT(service.description, ' : ',sku.description) as Line_Item, Count(*) as NUM FROM `billing_dataset.enterprise_billing` GROUP BY CONCAT(service.description, ' : ',sku.description)
```

### Congratulations !!!👇🏼👇🏼👇🏼⬇️😊❤️
## 👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼😊❤️
### DO JOIN OUR [TELEGRAM Link](https://t.me/+VsYwuNuMI9NiNzM9) 
### DO JOIN WHATSAPP [Whatsapp Link](https://chat.whatsapp.com/BeGG0HXiM469i3WFMgm4qs)
### 👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼⬇️⬇️⬇️⬇️⬇️😊❤️
### PLEASE DO LIKE AND SUBSCRIBE DEVLABS.AI FOR MORE UPDATES !!!
### SUBSCRIBE [LINK HERE](https://www.youtube.com/channel/UCVFPYmP2CZvVmICxw7YHT8A)
