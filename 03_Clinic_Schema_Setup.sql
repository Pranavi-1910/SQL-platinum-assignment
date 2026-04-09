
CREATE TABLE clinics (
    cid VARCHAR(20) PRIMARY KEY,
    clinic_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE customer (
    uid VARCHAR(30) PRIMARY KEY,
    name VARCHAR(100),
    mobile VARCHAR(15)
);

CREATE TABLE clinic_sales (
    oid VARCHAR(30) PRIMARY KEY,
    uid VARCHAR(30),
    cid VARCHAR(20),
    amount INT,
    datetime DATETIME,
    sales_channel VARCHAR(20)
);

CREATE TABLE expenses (
    eid VARCHAR(30) PRIMARY KEY,
    cid VARCHAR(20),
    description VARCHAR(100),
    amount INT,
    datetime DATETIME
);

-- clinics
INSERT INTO clinics VALUES
('cnc-01','XYZ Clinic','Mumbai','Maharashtra','India'),
('cnc-02','ABC Clinic','Pune','Maharashtra','India'),
('cnc-03','Care Clinic','Hyderabad','Telangana','India');

-- customers
INSERT INTO customer VALUES
('u1','Rahul','9876543210'),
('u2','Priya','9123456780'),
('u3','Amit','9988776655');

-- sales
INSERT INTO clinic_sales VALUES
('o1','u1','cnc-01',25000,'2021-09-23 12:00:00','online'),
('o2','u2','cnc-01',15000,'2021-10-10 10:00:00','offline'),
('o3','u3','cnc-02',30000,'2021-10-15 14:00:00','online'),
('o4','u1','cnc-03',20000,'2021-11-05 09:00:00','app'),
('o5','u2','cnc-02',18000,'2021-11-20 18:00:00','online');

-- expenses
INSERT INTO expenses VALUES
('e1','cnc-01','supplies',5000,'2021-09-23 07:00:00'),
('e2','cnc-01','rent',7000,'2021-10-01 07:00:00'),
('e3','cnc-02','staff',10000,'2021-10-10 07:00:00'),
('e4','cnc-03','equipment',8000,'2021-11-01 07:00:00'),
('e5','cnc-02','maintenance',6000,'2021-11-15 07:00:00');
