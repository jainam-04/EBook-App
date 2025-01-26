# Ebook Management System  

## Table of Contents  
1. [Project Overview](#project-overview)  
2. [Features](#features)  
   - [User Functionality](#user-functionality)  
   - [Admin Functionality](#admin-functionality)  
3. [Technology Stack](#technology-stack)  
4. [Installation and Setup](#installation-and-setup)  
   - [Prerequisites](#prerequisites)  
   - [Steps to Run the Project](#steps-to-run-the-project)

## Project Overview  
The **Ebook Management System** is a web-based application developed using JSP, Servlet, and JDBC. It enables users to buy, sell, and manage ebooks seamlessly. The system also includes an admin panel for managing the entire platform.  

## Features  

### User Functionality  
1. **Book Viewing**:  
   - View books categorized into Recent, Old, and New.  

2. **Cart and Order Management**:  
   - Add books to the cart and place orders to the respective address.  
   - Payment method: Cash on Delivery.  

3. **Sell and Delete Books**:  
   - Users can sell books, which will be categorized under the "Old" category.  
   - Users can delete the books they have added to the system.  

4. **Registration and Login**:  
   - Users must register and log in with their name, email ID, and password.  
   - Only logged-in users can add books to their cart or manage their orders.  

5. **Order History**:  
   - Users can view only their own orders.  

### Admin Functionality  
1. **Manage Books**:  
   - Add, edit, and delete books in the system.  

2. **View All Books and Orders**:  
   - Admins can view all books and oversee all user orders.  

3. **Comprehensive Control**:  
   - Admins have full authority to manage the platform, ensuring smooth operations.  

## Technology Stack  
- **Frontend**: JSP (JavaServer Pages)  
- **Backend**: Servlet  
- **Database**: MySQL using JDBC for database interaction  

## Installation and Setup  

### Prerequisites  
- Java Development Kit (JDK)  
- Apache Tomcat Server  
- MySQL Database  
- Integrated Development Environment (IDE) like Eclipse or IntelliJ IDEA  

### Steps to Run the Project  
1. Clone the repository:  
   ```bash  
   git clone https://github.com/jainam-04/EBook-App
   ```
2. Import the project into your IDE.
3. Configure the database:
   - Create a MySQL database.
   - Import the provided SQL script to set up the necessary tables.

### Setup the MySQL Database
  - Create a new database in MySQL:
    ```sql
      CREATE DATABASE ebook_management_system;
    ```
  - Use the following schema to create the necessary tables for the system:
      ```sql
        use ebook_management_system;

        CREATE TABLE book_details(
            book_id INT PRIMARY KEY AUTO_INCREMENT,
            book_name VARCHAR(30),
            author_name VARCHAR(30),
            price VARCHAR(20),
            book_category VARCHAR(20),
            status VARCHAR(20),
            photo VARCHAR(30),
            email VARCHAR(30)
        );

        CREATE TABLE book_order(
            id INT PRIMARY KEY AUTO_INCREMENT,
            order_id VARCHAR(30),
            user_name VARCHAR(50),
            email VARCHAR(30),
            address VARCHAR(500),
            phone_no VARCHAR(20),
            book_name VARCHAR(30),
            author_name VARCHAR(30),
            price VARCHAR(20),
            payment_type VARCHAR(30)
        );

        CREATE TABLE cart(
            cart_id INT PRIMARY KEY AUTO_INCREMENT,
            book_id INT,
            user_id INT,
            book_name VARCHAR(50),
            author_name VARCHAR(50),
            price VARCHAR(10)
            total_price VARCHAR(20)
        );

        CREATE TABLE user(
            id INT PRIMARY KEY AUTO_INCREMENT,
            name VARCHAR(50),
            email VARCHAR(50),
            phone_no VARCHAR(20),
            password VARCHAR(50)
        );
      ```
