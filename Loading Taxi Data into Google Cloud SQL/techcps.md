
## 💡 Lab Link: [Loading Taxi Data into Google Cloud SQL](https://www.cloudskillsboost.google/focuses/35625?parent=game)

## 🚀 Lab Solution [Watch Here]()



```
curl -LO raw.githubusercontent.com/Raghavkripasthya/cloud-minions/main/Loading%20Taxi%20Data%20into%20Google%20Cloud%20SQL/cloudminions.sh
sudo chmod +x cloudminions.sh
./cloudminions.sh
```

- **When prompted for a password enter `Passw0rd`**



```
create database if not exists bts;
use bts;

drop table if exists trips;

create table trips (
  vendor_id VARCHAR(16),    
  pickup_datetime DATETIME,
  dropoff_datetime DATETIME,
  passenger_count INT,
  trip_distance FLOAT,
  rate_code VARCHAR(16),
  store_and_fwd_flag VARCHAR(16),
  payment_type VARCHAR(16),
  fare_amount FLOAT,
  extra FLOAT,
  mta_tax FLOAT,
  tip_amount FLOAT,
  tolls_amount FLOAT,
  imp_surcharge FLOAT,
  total_amount FLOAT,
  pickup_location_id VARCHAR(16),
  dropoff_location_id VARCHAR(16)
);
```

### Congratulations
