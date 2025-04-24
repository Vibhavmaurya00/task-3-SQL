create database ecommerce;
use ecommerce;
CREATE TABLE Country (
    CountryID INT AUTO_INCREMENT PRIMARY KEY,
    CountryName VARCHAR(255) NOT NULL
);
CREATE TABLE Customer
(
	CustomerID int AUTO_INCREMENT PRIMARY KEY,
	FirstName varchar(255) NOT NULL,
	LastName varchar(255) NOT NULL,
	DOB date NOT NULL,
	Email varchar(255) NOT NULL,
	Password varchar(255) NOT NULL,
	Contact varchar(255) NOT NULL
);
CREATE TABLE City
(
	CityID int AUTO_INCREMENT PRIMARY KEY,
	CityName varchar(255) NOT NULL
);
CREATE TABLE ZipCode (
    ZipCodeID INT AUTO_INCREMENT PRIMARY KEY,
    CityID INT NOT NULL,
    CountryID INT NOT NULL,
    FOREIGN KEY (CityID) REFERENCES City(CityID),
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);
CREATE TABLE Address
(
	AddressID int AUTO_INCREMENT PRIMARY KEY,
	HouseNo varchar(255) NOT NULL,
	Street int NOT NULL,
	CustomerID int NOT NULL,
	ZipCodeID int  NOT NULL,
	Area varchar(255) NOT NULL
);
INSERT INTO Address (HouseNo, Street, CustomerID, ZipCodeID, Area)
VALUES
('207', 47, 1, 1, 'Baldia Town'),
('30', 11, 2, 1, 'Bin Qasim Town'),
('52', 20, 3, 1, 'Bin Qasim Town'),
('143', 32, 4, 1, 'Gadap Town'),
('344', 37, 5, 1, 'Gadap Town'),
('272', 58, 6, 1, 'Gulberg Town'),
('109', 20, 7, 1, 'Gulberg Town'),
('86', 58, 8, 1, 'Gulshan Town'),
('309', 2, 9, 1, 'Gulshan-e-Iqbal Town'),
('450', 50, 10, 1, 'Jamshed Town'),
('389', 26, 11, 1, 'Jamshed Town');
CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

CREATE TABLE Vendor (
    VendorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address TEXT NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Contact VARCHAR(255) NOT NULL
);

CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE VendorProduct (
    VendorProductID INT AUTO_INCREMENT PRIMARY KEY,
    VendorID INT NOT NULL,
    ProductID INT NOT NULL,
    Price DECIMAL(19, 2) NOT NULL,
    Quantity INT NOT NULL,
    Description TEXT NOT NULL,
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Courier (
    CourierID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Contact VARCHAR(255) NOT NULL
);

CREATE TABLE VendorCourier (
    VendorCourierID INT AUTO_INCREMENT PRIMARY KEY,
    VendorID INT NOT NULL,
    CourierID INT NOT NULL,
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID)
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    AddressID INT NOT NULL,
    VendorCourierID INT NOT NULL,
    TrackingID VARCHAR(255) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
    FOREIGN KEY (VendorCourierID) REFERENCES VendorCourier(VendorCourierID)
);

CREATE TABLE OrderedProduct (
    OrderedProductID INT AUTO_INCREMENT PRIMARY KEY,
    VendorProductID INT NOT NULL,
    OrderID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (VendorProductID) REFERENCES VendorProduct(VendorProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Review (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    Rating TINYINT NOT NULL,
    Comment TEXT,
    CustomerID INT NOT NULL,
    OrderedProductID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (OrderedProductID) REFERENCES OrderedProduct(OrderedProductID)
);

CREATE TABLE Cart (
    CartID INT AUTO_INCREMENT PRIMARY KEY,
    DateCreated DATE NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
INSERT INTO Cart (DateCreated, CustomerID)
VALUES
('2016-04-30', 1),  -- CustomerID 1 (Ali)
('2015-05-30', 2),  -- CustomerID 2 (Bilal)
('2015-05-18', 3),  -- CustomerID 3 (Kamil)
('2015-12-17', 4),  -- CustomerID 4 (Saim)
('2014-11-20', 5),  -- CustomerID 5 (Asad)
('2012-11-22', 6),  -- CustomerID 6 (Hassan)
('2013-10-23', 7),  -- CustomerID 7 (Ahmed)
('2015-01-28', 8),  -- CustomerID 8 (Saad)
('2014-02-25', 9),  -- CustomerID 9 (Faisal)
('2015-02-08', 10), -- CustomerID 10 (Zeeshan)
('2017-01-13', 11); -- CustomerID 11 (Rehan)

CREATE TABLE CartProduct (
    CartProductID INT AUTO_INCREMENT PRIMARY KEY,
    VendorProductID INT NOT NULL,
    Quantity INT NOT NULL,
    CartID INT NOT NULL,
    FOREIGN KEY (VendorProductID) REFERENCES VendorProduct(VendorProductID),
    FOREIGN KEY (CartID) REFERENCES Cart(CartID)
)

