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

/* Create treatments table */
CREATE TABLE treatments (
    ID INT PRIMARY KEY,
    type VARCHAR(255),
    name VARCHAR(255)
);

/* Create invoice_items table */
CREATE TABLE invoice_items (
  ID INT PRIMARY KEY,
  unit_price DECIMAL(7,2),
  quantity INT,
  total_price DECIMAL(7,2),
  invoice_id INT,
  treatments_id INT,
  CONSTRAINT fk_invoice_id FOREIGN KEY (invoice_id) REFERENCES invoices(ID),
  CONSTRAINT fk_treatments_id FOREIGN KEY (treatments_id) REFERENCES treatments(ID)
)
