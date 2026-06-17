-- Create Database
CREATE DATABASE IF NOT EXISTS login_db;

-- Use Database
USE login_db;

-- Create Users Table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

-- Insert Sample Users
INSERT INTO users (username, password) VALUES
('admin', '12345'),
('bimal', 'password123'),
('user1', '11111');