# 🍽️ Food Delivery Data Analysis using MySQL

This repository contains SQL queries for analyzing a food delivery platform's orders database. The queries are written in **MySQL** and focus on **customer behavior**, **restaurant performance**, and **promotion effectiveness** — all derived using modern SQL techniques like **CTEs**, **window functions**, and **date operations**.

---

## 📁 Dataset Assumption

All queries use a single table named `orders` with the following assumed structure:

| Column Name        | Data Type     | Description                           |
|--------------------|---------------|---------------------------------------|
| `order_id`         | INT           | Unique order ID                       |
| `customer_code`    | VARCHAR       | Unique ID for each customer           |
| `restaurant_id`    | VARCHAR       | Unique ID for each restaurant         |
| `placed_at`        | DATETIME      | Timestamp of when the order was placed |
| `cuisine`          | VARCHAR       | Cuisine type of the restaurant        |
| `promo_code_name`  | VARCHAR       | Name of the promo code used (NULL if none) |

---

## 📊 SQL Insights & Use Cases

### 1. 🔝 Top 3 Restaurants by Cuisine
Returns the top 3 performing restaurants per cuisine type based on total orders.

### 2. 📈 Daily New Customer Acquisition
Calculates the number of new users acquired each day based on their first-ever order date.

### 3. 🧊 One-Time Users Acquired in Jan 2025
Identifies customers who placed exactly one order in January 2025 and never returned after that.

### 4. 🔁 Every 3rd Order Trigger
Fetches every third order placed by each customer on the current date — useful for reward or coupon triggers.

### 5. 🎯 Promo-Only Loyal Customers
Finds customers with more than one order where **every** order was made using a promo code.

### 6. 🌱 Organic Customer % in January
Calculates the percentage of users acquired in January who placed their first order **without any promo**.

### 7. 💤 Inactive Yet Promo-Acquired Customers
Tracks users who were acquired in the past month using a promo code but haven’t placed an order in the last 7 days.

---

## 🛠️ Features Used

- ✅ Common Table Expressions (CTEs)
- ✅ `ROW_NUMBER()` Window Function
- ✅ Date Manipulation with `CURDATE()`, `DATE_SUB()`, etc.
- ✅ Conditional Aggregation
- ✅ Clean, readable SQL formatting

---

## 📦 Usage

You can directly copy and run these queries in your MySQL environment, provided your schema matches the structure mentioned above. These queries are modular and can be easily adapted for PostgreSQL or BigQuery with minor changes.

---

## 💡 Ideal For

- 📄 Resume Projects & Portfolios
- 🎓 Academic Case Studies
- 💼 SQL Interview Prep
- 📊 Business/Data Analyst Capstone Projects

---

## 🔗 Connect

Made with ❤️ by [Your Name]  
Feel free to reach out on [LinkedIn](https://www.linkedin.com/) or raise an issue for suggestions/improvements.

