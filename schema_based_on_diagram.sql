/* Create patients table */
CREATE TABLE patients(
   ID          INT,
   name        VARCHAR (20),
   date_of_birth         date,
   PRIMARY KEY (ID)
);

/* Create medical_histories table */
CREATE TABLE medical_histories(
   ID          INT,
	admitted_at		TIMESTAMP,
   patient_id 		int,
	status 			varchar(50),
	CONSTRAINT fk_patient_id
	FOREIGN KEY (patient_id) 
	REFERENCES patients(ID),
   PRIMARY KEY (ID)
);

/* Create invoices table */
CREATE TABLE invoices(
   ID          INT,
	total_amount		decimal(5,  2),
   generated_at 		TIMESTAMP,
	paid_at				TIMESTAMP,
	medical_history_id int,
	CONSTRAINT fk_med_history_id
	FOREIGN KEY (medical_history_id) 
	REFERENCES medical_histories(ID),
   PRIMARY KEY (ID)
);
