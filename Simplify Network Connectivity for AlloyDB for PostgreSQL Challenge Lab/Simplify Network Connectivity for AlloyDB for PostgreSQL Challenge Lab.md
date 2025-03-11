
##  Simplify Network Connectivity for AlloyDB for PostgreSQL: Challenge Lab | [GCC040](https://www.youtube.com/@quick_lab/videos)

###  **Solution Video:** [Watch Here](https://youtu.be/G3uvEbvXcz8)


```bash
curl -LO raw.githubusercontent.com/RaghavKripasthya/cloud-minions/refs/heads/main/Simplify%20Network%20Connectivity%20for%20AlloyDB%20for%20PostgreSQL%20Challenge%20Lab/devlabsaigcc040.sh
sudo chmod +x devlabsaigcc040.sh
./devlabsaigcc040.sh
```

```bash
psql -h REPLACE_IP -U postgres -d postgres
```
---
```bash

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    medical_record_number VARCHAR(100) UNIQUE,
    last_visit_date DATE,
    primary_physician VARCHAR(100)
);


INSERT INTO patients (patient_id, first_name, last_name, date_of_birth, medical_record_number, last_visit_date, primary_physician)
VALUES 
(1, 'John', 'Doe', '1985-07-12', 'MRN123456', '2024-02-20', 'Dr. Smith'),
(2, 'Jane', 'Smith', '1990-11-05', 'MRN654321', '2024-02-25', 'Dr. Johnson');


CREATE TABLE clinical_trials (
    trial_id INT PRIMARY KEY,
    trial_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    lead_researcher VARCHAR(100),
    number_of_participants INT,
    trial_status VARCHAR(20)
);


INSERT INTO clinical_trials (trial_id, trial_name, start_date, end_date, lead_researcher, number_of_participants, trial_status)
VALUES 
    (1, 'Trial A', '2025-01-01', '2025-12-31', 'Dr. John Doe', 200, 'Ongoing'),
    (2, 'Trial B', '2025-02-01', '2025-11-30', 'Dr. Jane Smith', 150, 'Completed');
```


---

### Congratulations!!!👇🏼👇🏼👇🏼⬇️😊❤️
## 👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼😊❤️
### DO JOIN OUR [TELEGRAM Link](https://t.me/+VsYwuNuMI9NiNzM9) 
### DO JOIN WHATSAPP [Whatsapp Link](https://chat.whatsapp.com/BeGG0HXiM469i3WFMgm4qs)
### 👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼👇🏼⬇️⬇️⬇️⬇️⬇️😊❤️
### PLEASE DO LIKE AND SUBSCRIBE DEVLABS.AI FOR MORE UPDATES !!!
### SUBSCRIBE [LINK HERE](https://www.youtube.com/channel/UCVFPYmP2CZvVmICxw7YHT8A)

