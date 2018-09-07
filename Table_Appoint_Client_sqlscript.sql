REM   Script: Creating of table
REM   This program is just for test.

CREATE TABLE CLIENTS 
  (clientID char(8), 
  first_name varchar(25) NOT NULL, 
  last_name varchar(25) NOT NULL, 
  age number(3), 
  gender char(1), 
  phone# number(10), 
  city varchar(29), 
  address varchar(35), 
  postal_code char(6));

CREATE TABLE APPOINTMENTS  
  (appointmentID char (8), 
  clientID char(8), 
  appointment_date  Date);

CREATE TABLE EMPLOYEE  
  (employeeID char (8), 
  first_name varchar2(25) NOT NULL, 
  last_name varchar2(25) NOT NULL, 
  age number(5), 
  gender char(6), 
  phone# number(10), 
  address varchar2(50), 
  postalCode char(12), 
  bank_account# number (20), 
  sin# char(15), 
  monthly_salary number(15), 
  yearly_bonus number(15), 
  department varchar2(25), 
  position varchar2(30));

CREATE TABLE SALESPERSONS 
  (salespersonsID char(8), 
  appointmentID char(8), 
  assistanceID char(8), 
  employeeID char(8), 
  first_name varchar(25) NOT NULL, 
  last_name varchar(25) NOT NULL, 
  gender char(1), 
  age number(3), 
  available_date  Date);

CREATE TABLE ASSISTANCE 
  (assistanceID char(8), 
  clientID char(8), 
  insurance char(9), 
  carPlate varchar(8));

ALTER TABLE CLIENTS 
  ADD CONSTRAINT clients_id_pk PRIMARY KEY (clientID);

ALTER TABLE CLIENTS  
  ADD CONSTRAINT clients_gender_ck CHECK (gender IN ('M', 'F'));

ALTER TABLE APPOINTMENTS 
  ADD CONSTRAINT appointments_id_pk PRIMARY KEY (appointmentID);

ALTER TABLE APPOINTMENTS  
  ADD CONSTRAINT appointments_clientID_fk FOREIGN KEY (clientID) 
            REFERENCES CLIENTS (clientID);

ALTER TABLE EMPLOYEE 
  ADD CONSTRAINT employee_id_pk PRIMARY KEY (employeeID);

ALTER TABLE ASSISTANCE  
  ADD CONSTRAINT assistance_assistanceID_fk PRIMARY KEY (assistanceID);

ALTER TABLE ASSISTANCE  
  ADD CONSTRAINT assistance_clientID_fk FOREIGN KEY (clientID) 
            REFERENCES CLIENTS (clientID);

ALTER TABLE SALESPERSONS  
  ADD CONSTRAINT salespersons_salespersonsID_pk PRIMARY KEY (salespersonsID);

ALTER TABLE SALESPERSONS  
  ADD CONSTRAINT salespersons_assistanceID_fk FOREIGN KEY (assistanceID) 
            REFERENCES ASSISTANCE (assistanceID);

ALTER TABLE SALESPERSONS  
  ADD CONSTRAINT salespersons_assitanceID_fk FOREIGN KEY (appointmentID) 
            REFERENCES APPOINTMENTS (appointmentID);

ALTER TABLE SALESPERSONS  
  ADD CONSTRAINT salespersons_employeeID_fk FOREIGN KEY (employeeID) 
            REFERENCES EMPLOYEE (employeeID);

INSERT INTO clients 
  VALUES ('001pt','John', 'Jiang',36, 'M',4165558974,'Toronto', '25 Jane', 'M9C2Z2');

INSERT INTO clients  
  VALUES ('002pt', 'Sabrina', 'Jerry',29, 'F', 4166663555, 'Scarborough', 'Finch', 'N3W2S4');

INSERT INTO clients  
  VALUES ('003pt', 'Jenifer', 'Zola', 24, 'F', 6478659585, 'Toronto', 'West Road', 'M9N5Z8');

INSERT INTO clients  
  VALUES ('004pt','Sara', 'Jeff', 19, 'F', 6475586789, 'Toronto', 'Yonge St', 'M8N2Y6');

INSERT INTO clients  
  VALUES ('005pt', 'Jelo', 'Song', 35, 'F', 6479897526, 'Mississauga', 'Satalight Ave', 'M9N6E7');

INSERT INTO clients  
  VALUES ('006pt', 'Delan', 'Sung', 27, 'M',6474789652, 'Toronto', 'Little Ave', 'H8F2Y8');

INSERT INTO Appointments 
  VALUES ('001apt', '001pt', '15-SEP-15');

INSERT INTO Appointments 
 VALUES('002apt', '002pt', '25-DEC-15');

INSERT INTO Appointments  
  VALUES('003apt', '003pt', '04-FEB-16');

INSERT INTO Appointments 
  VALUES('004apt','004pt', '17-MAR-16');

INSERT INTO Appointments  
  VALUES('005apt', '005pt', '20-JUN-16');

INSERT INTO assistance VALUES 
('001as', '001pt', 'Full', '229ADC');

INSERT INTO assistance VALUES 
('002as', '002pt', 'Half', '234GFG');

INSERT INTO assistance VALUES 
('003as', '003pt', 'Half', '687FRT');

INSERT INTO assistance VALUES 
('004as', '005pt', 'Full', '589GLA');

INSERT INTO employee  
  VALUES('001em', 'David', 'Lynn', 35, 'male', 6477813261, 'kennedy', 'm1k4m2', 4791939412, 's804', 2500, 1500, 'sales', 'salesperson');

INSERT INTO employee  
  VALUES ('002em', 'Gordon', 'Stevens', 40, 'male', 6478851618, 'finch', 'm1l3b5', 2891939781, 's806', 3500, 1600, 'sales', 'salesperson');

INSERT INTO employee  
  VALUES ('003em', 'Fiona', 'Richardson', 26, 'female', 6476775284, 'brimley', 'm1n3b6', 2891939494, 's807', 3000, 1700, 'sales', 'salesperson');

INSERT INTO employee  
  VALUES ('004em', 'Brian', 'Johnson', 31, 'male', 6476885195, 'danforth', 'm1k3m7', 2891939495, 's808', 1500, 1000, 'reception', 'receptionist');

INSERT INTO employee  
  VALUES ('005em', 'James', 'Robert', 22, 'male', 4166582654, 'morningside', 'm1s4b9', 2891747496, 's809', 1500, 1000, 'reception', 'receptionist');

INSERT INTO salespersons  
  VALUES('001sp','001apt', '001as', '005em' ,'James', 'Robert', 'M', '39', '16-OCT-15');

INSERT INTO salespersons  
  VALUES('002sp','002apt', '002as', '003em' ,'Fiona', 'Richardson', 'M', '26', '11-DEC-15');

INSERT INTO salespersons  
  VALUES('003sp','003apt', '003as', '004em' ,'Brian', 'Johnson', 'M', '33', '19-NOV-15');

INSERT INTO salespersons  
  VALUES('004sp','004apt', '004as', '001em' ,'David', 'Lynn', 'M', '32', '18-FEB-16');

