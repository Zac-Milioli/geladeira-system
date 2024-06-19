CREATE DATABASE GELADEIRA;
GO

USE GELADEIRA;
GO

CREATE TABLE products (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX),
    validity DATE
);
GO


CREATE TABLE on_fridge (
    id INT PRIMARY KEY IDENTITY(1,1),
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(id)
);
GO


CREATE TABLE on_freezer (
    id INT PRIMARY KEY IDENTITY(1,1),
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(id)
);
GO
