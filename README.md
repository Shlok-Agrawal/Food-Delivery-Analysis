# 🍽️ Food Delivery Data Analysis using MySQL

This repository contains SQL queries for analyzing a food delivery platform's orders database. The queries are written in **MySQL** and focus on **customer behavior**, **restaurant performance**, and **promotion effectiveness** — all derived using modern SQL techniques like **CTEs**, **window functions**, and **date operations**.

---
## 📁 Dataset Schema

All queries are based on a single table named `orders`, structured as follows:

| Column Name       | Data Type     | Description                                               |
|-------------------|---------------|-----------------------------------------------------------|
| `order_id`        | `VARCHAR(20)` | Unique identifier for each order                          |
| `customer_code`   | `VARCHAR(20)` | Unique ID for each customer                               |
| `placed_at`       | `DATETIME`    | Timestamp of when the order was placed                    |
| `restaurant_id`   | `VARCHAR(10)` | ID of the restaurant that fulfilled the order             |
| `cuisine`         | `VARCHAR(20)` | Type of cuisine offered by the restaurant                 |
| `order_status`    | `VARCHAR(20)` | Status of the order (e.g., Completed, Cancelled, Failed) |
| `promo_code_name` | `VARCHAR(20)` | Name of the promo code used (NULL if none was used)       |

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
