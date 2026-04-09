
CREATE TABLE users (
    user_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100),
    phone_number int,
    mail_id VARCHAR(100),
    billing_address VARCHAR(255)
);

INSERT INTO users(user_id, name, phone_number, mail_id,billing_address) VALUES
('rahul-67r','Rahul sharma', 123456789, 'Rahul@gmail.com', '21_street,chennai'),
('angali-94a','Angali gupta', 213456789, 'Angali@gmail.com','25_street, gujarat'),
('ramya-47r','ramya dekshit',231456789, 'Ramya@gmail.com','street no:12,madhyapradesh'),
('kathak-99k', 'kathak Raj', 124356987, 'kathak@gmail.com','90-street,kerala'),
('raghu-45r', 'raghu nandhan', 212343564, 'raghu@gmail.com','46_street,maharastra');

CREATE TABLE bookings (
    booking_id VARCHAR(30) PRIMARY KEY,
    booking_date DATETIME,
    room_no VARCHAR(30),
    user_id VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO bookings (booking_id, booking_date, room_no, user_id) VALUES
('bk-09f3e-95hj', '2021-09-23 07:36:48', 'rm-bhf9-aerjn', 'rahul-67r'),
('bk-12ab3-cd45', '2021-10-01 10:15:20', 'rm-xyt9-klmno', 'angali-94a'),
('bk-78gh9-ij01', '2021-11-05 14:25:10', 'rm-pqr4-stuvw', 'ramya-47r'),
('bk-34kl5-mn67', '2021-12-12 18:40:55', 'rm-abc1-defgh', 'kathak-99k'),
('bk-90op2-qr34', '2022-01-20 09:05:30', 'rm-uvw7-xyzab', 'raghu-45r');

CREATE TABLE booking_commercials (
    id VARCHAR(20) PRIMARY KEY,
    booking_id VARCHAR(30),
    bill_id VARCHAR(30),
    bill_date DATETIME,
    item_id VARCHAR(30),
    item_quantity INT,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

INSERT INTO booking_commercials (id, booking_id, bill_id, bill_date, item_id, item_quantity) VALUES
('q34r-3q4o8-q34u','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a9e8-q8fu',3),
('a12b-4c5d6-e78f','bk-12ab3-cd45','bl-1b23c-d456','2021-10-05 10:15:30','itm-b7g6-h5ij',2),
('x98y-7z6w5-v4u3','bk-78gh9-ij01','bl-9k87l-m654','2021-10-18 14:45:10','itm-c3d2-e1fg',5),
('p56q-1r2s3-t4u5','bk-34kl5-mn67','bl-3n45o-p678','2021-11-02 09:20:40','itm-h8i7-j6kl',1),
('z21x-9c8v7-b6n5','bk-90op2-qr34','bl-7q89r-s012','2021-12-12 18:30:25','itm-m5n4-o3pq',4);

CREATE TABLE items (
    item_id VARCHAR(30) PRIMARY KEY,
    item_name VARCHAR(100),
    item_rate INT
);

INSERT INTO items (item_id, item_name, item_rate) VALUES
('itm-a9e8-q8fu', 'Tawa Paratha', 18),
('itm-b7g6-h5ij', 'Paneer Butter Masala', 120),
('itm-c3d2-e1fg', 'Veg Biryani', 150),
('itm-h8i7-j6kl', 'Masala Dosa', 50),
('itm-m5n4-o3pq', 'Idli Sambar', 40);
