
##  Lab Link: [Analyzing Network Traffic with VPC Flow Logs](https://www.cloudskillsboost.google/focuses/45798?parent=catalog)

## 😊 Lab Solution [Watch Here](https://youtu.be/6gJKRfPLVI8)



---

## Export the ZONE name correctly:

```
export ZONE=
```

## Copy and run the below commands in Cloud Shell:

```
curl -LO raw.githubusercontent.com/RaghavKripasthya/cloud-minions/main/Analyzing%20Network%20Traffic%20with%20VPC%20Flow%20Logs/devlabsai.sh
sudo chmod +x devlabsai.sh
./devlabsai.sh
```
---

## 😊Now please watch the video carefully and follow the instructions

---

```
CP_IP=$(gcloud compute instances describe web-server --zone=$ZONE --format='get(networkInterfaces[0].accessConfigs[0].natIP)')

export MY_SERVER=$CP_IP

for ((i=1;i<=50;i++)); do curl $MY_SERVER; done
```

### Congratulations!!
 ## PLEASE DO LIKE AND SUBSCRIBE FOR MORE UPDATES ON DEVLABS.AI !!👇🏼👇🏼👇🏼

 👇🏼👇🏼👇🏼👇🏼⬇️❤️😊

 Subscribe [Link Here](https://www.youtube.com/channel/UCVFPYmP2CZvVmICxw7YHT8A)
