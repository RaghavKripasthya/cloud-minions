
##  Migrate MySQL Data to Cloud SQL using Database Migration Service: Challenge Lab | [GSP351](https://www.cloudskillsboost.google/focuses/20393?parent=catalog)

###  **Solution Video:** [Watch Here]()


## **Task 1: Enable APIs**

Enable the following APIs in your Google Cloud project:
1. **Database Migration API**
2. **Service Networking API**



To connect to the MySQL interactive console, now follow these steps:

1. Run the following command in your terminal:
   ```bash
   mysql -u admin -p
   ```

2. When prompted for the password, enter:
   ```bash
   changeme
   ```

---

## **Task 4.2: Update Records in the Database**

Once connected to the MySQL console:

1. Switch to the database named `customers_data`:
   ```sql
   use customers_data;
   ```

2. Run the following SQL command to update the gender field for a specific record:
   ```sql
   update customers set gender = 'FEMALE' where addressKey = 934;
   ```

---

## Congratulations!!!


