CREATE DATABASE signup_db;

USE signup_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    address TEXT,
    phone VARCHAR(15),
    email VARCHAR(100),
    dob DATE,
    photo VARCHAR(255)
);