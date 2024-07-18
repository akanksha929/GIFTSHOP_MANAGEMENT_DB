-- Create the database
CREATE DATABASE GiftShopDB;
USE GiftShopDB;


-- Creating relevant tables
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Buyers (
    buyer_id INT AUTO_INCREMENT PRIMARY KEY,
    buyer_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20),
    address VARCHAR(255),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    buyer_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (buyer_id) REFERENCES Buyers(buyer_id)
);

CREATE TABLE Customers (
    customer_id INT NOT NULL,
    sale_id INT AUTO_INCREMENT NOT NULL,
    full_name VARCHAR(100) NOT NULL,  
    age INT NOT NULL,
    email VARCHAR(100)  NOT NULL,
    phone_number VARCHAR(15)  NOT NULL,
    PRIMARY KEY (customer_id, sale_id),
    FOREIGN KEY (sale_id) REFERENCES SalesDetails(sale_id)
);

CREATE TABLE SalesDetails (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    sale_date DATETIME NOT NULL,
    num_OF_pieces INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE SalesChannels (
    sale_channel_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT NOT NULL,
    channel_type ENUM('Online', 'Offline') NOT NULL,
    FOREIGN KEY (sale_id) REFERENCES SalesDetails(sale_id)
);

CREATE TABLE ProfitMargins (
    margin_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    profit_margin DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Employees (
    employee_id INT ,
    full_name VARCHAR(50) NOT NULL,
    position VARCHAR(50),
    salary DECIMAL(10, 2),
    category_id INT,
    PRIMARY KEY (employee_id, category_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- INSERTING VALUES IN TABLES

INSERT INTO Categories (category_name) VALUES
('Toys'),
('Books'),
('Jewellery'),
('Chocolates'),
('Decor'),
('Accessories'),
('Customised gifts'),
('Cards and Hampers');

INSERT INTO Buyers (buyer_name, contact_name, contact_email, contact_phone, address, category_id) VALUES
('Toys R Us', 'Rajesh Kumar', 'rajesh.kumar@toysrus.com', '123-456-7890', 'Kolkata', 1),
('Bookworms', 'Priya Sharma', 'priya.sharma@bookworms.com', '987-654-3210', 'Asansol', 2),
('Choco Delights', 'Arjun Singh', 'arjun.singh@chocodelights.com', '876-543-2109', 'Asansol', 3),
('Decor Emporium', 'Vikram Joshi', 'vikram.joshi@decoremporium.com', '567-890-1234', 'Kolkata', 4),
('Fashion Up', 'Aarti Desai', 'aarti.desai@fashionup.com', '678-901-2345', 'Kolkata', 5),
('Custom Gifts', 'Anand Gupta', 'anand.gupta@customgifts.com', '567-890-1234', 'Mednipur', 6),
('Hamper & Co.', 'Deepika Patel', 'deepika.patel@hamperco.com', '321-098-7654', 'Durgapur', 7);

INSERT INTO Products (product_name, category_id, price, stock_quantity, buyer_id) VALUES
('Teddy Bear', 1, 250, 50, 1),
('Toy Train Set', 1, 300, 30, 1),
('Educational Board Game', 1, 250, 40, 1),
('Harry Potter Book Set', 2, 300, 20, 2),
('Classic Novels Collection', 2, 500, 15, 2),
('Assorted chocolate', 3, 200, 25, 3),
('Ferrero Rocher', 3, 200, 35, 3),
('Chocolate Bouquet', 3, 600, 10, 3),
('Name plate', 4, 350, 25, 4),
('Wall Hanging', 4, 200, 50, 4),
('Vase', 4, 150, 45, 4),
('Gemstone Necklace', 5, 200, 25, 5),
('Silver Bracelet', 5, 100, 50, 5),
('Gold Earrings', 5, 120, 75, 5),
('Ring', 5, 60, 90, 5),
('Photo Frame', 6, 120, 40, 6),
('Alphabets', 6, 75, 30, 6),
('T-Shirt', 6, 100, 50, 6),
('Mugs', 6, 80, 40, 6),
('Your Own Hamper', 7, 500, 10, 7),
('Gift Crards', 7, 100, 45, 7),
('Money Cards', 7, 20, 100, 7);

INSERT INTO ProfitMargins (category_id, profit_margin) VALUES
(1, 15.00),
(2, 20.00),
(3, 18.00),
(4, 14.00),
(5, 20.00),
(6, 15.00),
(7, 22.00);


INSERT INTO Employees (employee_id, full_name, position, salary, category_id) VALUES
(1, 'Amit Sharma', 'Sales Manager', 10000.00, 2),  
(1, 'Amit Sharma', 'Sales Manager', 10000.00, 3),  
(2, 'Neha Verma', 'Sales Manager', 15000.00, 7),  
(2, 'Neha Verma', 'Sales Manager', 15000.00, 4),        
(2, 'Neha Verma', 'Sales Manager', 15000.00, 5),        
(3, 'Rahul Patel', 'Sales Manager', 7000.00, 6), 
(4, 'Akash Sharma', 'Trainee', 5000.00, 1); 

INSERT INTO SalesDetails (product_id, sale_date, num_OF_pieces, total_amount) VALUES
(20, '2024-07-01', 2, 1000.00),   
(13, '2024-07-01', 4, 400.00),   
(16, '2024-07-01', 5, 600.00),   
(1, '2024-07-01', 2, 300.00),   
(1, '2024-07-01', 4, 1000.00),  
(15, '2024-07-02', 6, 540.00),   
(16, '2024-07-02', 2, 240.00),   
(19, '2024-07-02', 3, 240.00),  
(10, '2024-07-02', 1, 200.00),   
(6, '2024-07-03', 4, 800.00), 
(21, '2024-07-03', 6, 600.00), 
(2, '2024-07-03', 3, 600.00),
(4, '2024-07-03', 1, 300.00), 
(5, '2024-07-04', 10, 900.00), 
(3, '2024-07-04', 2, 200.00), 
(9, '2024-07-04', 4, 320.00), 
(6, '2024-07-05', 3, 600.00),
(8, '2024-07-05', 2, 1200.00), 
(15, '2024-07-06', 2, 180.00), 
(20, '2024-07-06', 1, 500.00), 
(18, '2024-07-06', 8, 800.00), 
(7, '2024-07-06', 2, 400.00), 
(3, '2024-07-06', 1, 250.00), 
(5, '2024-07-06', 1, 500.00), 
(13, '2024-07-07', 1, 100.00), 
(17, '2024-07-07', 2, 150.00), 
(14, '2024-07-07', 3, 360.00);

INSERT INTO SalesChannels (sale_id, channel_type) VALUES
(1, 'Online'),
(2, 'Offline'),
(3, 'Offline'),
(4, 'Offline'),
(5, 'Online'),
(6, 'Online'),
(7, 'Online'),
(8, 'Online'),
(9, 'Offline'),
(10, 'Online'),
(11, 'Offline'),
(12, 'Offline'),
(13, 'Online'),
(14, 'Offline'),
(15, 'Online'),
(16, 'Offline'),
(17, 'Offline'),
(18, 'Online'),
(19, 'Online'),
(20, 'Online'),
(21, 'Offline'),
(22, 'Offline'),
(23, 'Online'),
(24, 'Offline'),
(25, 'Online'),
(26, 'Offline'),
(27, 'Offline');

INSERT INTO Customers (customer_id, full_name, age, email, phone_number) VALUES
(1, 'Rajesh Kumar', 28, 'rajesh.kumar@example.com', '43210'),
(2, 'Priya Sharma', 20, 'priya.sharma@example.com', '43211'),
(3, 'Amit Verma', 21, 'amit.verma@example.com', '43212'),
(4, 'Neha Singh', 26, 'neha.singh@example.com', '43213'),
(5, 'Vikram Patel', 40, 'vikram.patel@example.com', '43214'),
(6, 'Anjali Gupta', 22, 'anjali.gupta@example.com', '9815'),
(7, 'Suresh Reddy', 45, 'suresh.reddy@example.com', '98766'),
(1, 'Rajesh Kumar', 28, 'rajesh.kumar@example.com', '43210'),
(9, 'Rohit Mehra', 27, 'rohit.mehra@example.com', '93218'),
(3, 'Amit Verma', 21, 'amit.verma@example.com', '43212'),
(11, 'Manish Goel', 37, 'manish.goel@example.com', '93220'),
(12, 'Preeti Desai', 19, 'preeti.desai@example.com', '93221'),
(13, 'Karan Kapoor', 24, 'karan.kapoor@example.com', '43222'),
(14, 'Meena Khanna', 19, 'meena.khanna@example.com', '98223'),
(25, 'Binod Kumar', 23, 'binodkumar@example.com', '98458'),
(16, 'Pooja Jain', 34, 'pooja.jain@example.com', '43225'),
(17, 'Ramesh Thakur', 36, 'ramesh.thakur@example.com', '98226'),
(18, 'Nisha Agarwal', 29, 'nisha.agarwal@example.com', '98767'),
(19, 'Harsh Vardhan', 24, 'harsh.vardhan@example.com', '95628'),
(11, 'Manish Goel', 37, 'manish.goel@example.com', '93220'),
(21, 'Priya Vardhan', 29, 'priya.vardhan@example.com', '98718'),
(22, 'Sujeet Pandey', 29, 'sujeetpandey@example.com', '98458'),
(23, 'Priya Patel', 45, 'priyapatel@example.com', '98458'),
(24, 'Anita Pandey', 56, 'anitapandey@example.com', '98458'),
(25, 'Binod Kumar', 23, 'binodkumar@example.com', '98458'),
(22, 'Sujeet Pandey', 29, 'sujeetpandey@example.com', '98458'),
(3, 'Amit Verma', 21, 'amit.verma@example.com', '43212');



