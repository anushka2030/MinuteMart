CREATE DATABASE userdb;
USE userdb;
EXPLAIN ANALYZE SELECT * FROM addresses;

select *from locations;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255)
);
delete from users where id=7;
show tables;
select *from addresses;
select * from users;
update users set is_admin=0 where id=6;

UPDATE users SET is_admin = TRUE WHERE email = 'suman.kumari.rose.158@gmail.com';
select *from locations;
select *from addresses;


CREATE TABLE Locations (
    Location_ID INT PRIMARY KEY AUTO_INCREMENT,
    Location_Name VARCHAR(255) NOT NULL,
    Address TEXT NOT NULL
);


ALTER TABLE locations
ADD COLUMN is_available BOOLEAN DEFAULT 1;

select *from Category;
select *from Product;
select *from Locations;
DELETE FROM Locations where Location_ID=14;


CREATE TABLE Category (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(100) NOT NULL
);

show triggers;


CREATE TABLE StockManagement (
    Stock_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_ID INT NOT NULL,
    Location_ID INT NOT NULL,
    Last_Updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID),
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID)
);
select *from StockManagement;
delete from StockManagement where Location_ID=13;
insert into StockManagement (Category_ID,Location_ID) values (8,4);






CREATE TABLE Subcategory (
    Subcategory_ID INT PRIMARY KEY AUTO_INCREMENT,
    Subcategory_Name VARCHAR(100) NOT NULL,
    Category_ID INT NOT NULL,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);
select *from subcategory;
delete from subcategory where Subcategory_ID=39;


CREATE TABLE Supplier (
    Supplier_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Contact VARCHAR(20) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);
select *from Supplier;



CREATE TABLE Product (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock_Quantity INT NOT NULL,
    Expiry_Date DATE,
    Supplier_ID INT,
    Subcategory_ID INT NOT NULL,  -- Changed to Subcategory
    FOREIGN KEY (Subcategory_ID) REFERENCES Subcategory(Subcategory_ID),
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);


select *from Product;

delete from Product where Subcategory_ID=16;
CREATE TABLE addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    address_line TEXT NOT NULL,
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100)
);


SHOW CREATE TABLE addresses;

-- Association table between users and their saved address (1-to-1)
CREATE TABLE user_addresses (
    user_id INT PRIMARY KEY,
    address_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (address_id) REFERENCES addresses(id) ON DELETE CASCADE
);
select *from user_addresses;



CREATE TABLE Cart (
Cart_ID INT AUTO_INCREMENT PRIMARY KEY,
User_ID INT NOT NULL,
Product_ID INT NOT NULL,
Quantity INT DEFAULT 1,
FOREIGN KEY (User_ID) REFERENCES users (id) ON DELETE CASCADE,
FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID) ON DELETE CASCADE
);

select *from addresses;
select *from cart;


delete from delivery where user_id=1;
alter table Invoice add column quantity int not null;

drop table delivery;

select *from del_partner;
ALTER TABLE Invoice drop COLUMN cart_id;
drop  table invoice;
select *from cart;
ALTER TABLE Invoice MODIFY quantity INT NULL;
alter table invoice add column cart_id int;
CREATE TABLE del_partner (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    aadhar_no CHAR(16) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(10),
    photo VARCHAR(255),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(Location_ID)
);
delete from del_partner where id=13;
select *from del_partner;
ALTER TABLE del_partner ADD COLUMN password VARCHAR(255);
select *from orders;
ALTER TABLE del_partner
ADD CONSTRAINT unique_aadhar UNIQUE (aadhar_no),
ADD CONSTRAINT unique_email UNIQUE (email),
ADD CONSTRAINT unique_phone UNIQUE (phone_number);


CREATE TABLE delivery (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    delivery_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES Product(Product_ID)
);
ALTER TABLE delivery ADD order_id INT;
select *from delivery;
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
SELECT *FROM delivery;

ALTER TABLE delivery ADD order_id INT;
ALTER TABLE delivery
ADD COLUMN address_id INT,
ADD CONSTRAINT fk_delivery_address FOREIGN KEY (address_id) REFERENCES addresses(id);
ALTER TABLE delivery ADD COLUMN del_partner_id INT;
ALTER TABLE delivery ADD CONSTRAINT fk_delivery_partner FOREIGN KEY (del_partner_id) REFERENCES del_partner(id);
select *from del_partner;
delete from delivery where user_id=1;
CREATE TABLE cart_summary (
    summary_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total_pay DECIMAL(10,2) NOT NULL,
    smart_cart_fee DECIMAL(10,2) NOT NULL,
    delivery_fee DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

select * from cart_summary ;
delete from  orders where user_id=5;
ALTER TABLE orders ADD COLUMN is_delivered BOOLEAN DEFAULT 0;
select *from cart_summary;
select *from del_partner;
UPDATE del_partner SET name='Tanya' where id=21;