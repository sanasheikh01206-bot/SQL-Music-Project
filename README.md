Here is a professional README file structure tailored exactly to the SQL queries and business logic you wrote. You can copy and paste this directly into a `README.md` file on your GitHub repository.

---

# Digital Music Store SQL Analysis



## 📌 Project Overview

This project involves a comprehensive exploratory data analysis of a digital music store's relational database using SQL. By writing complex, multi-layered queries, this project extracts valuable business intelligence regarding organizational hierarchy, customer spending behaviors, and global sales trends.

## 🛠️ Tools & Technologies

* **Language:** SQL


* **Key Techniques:** Common Table Expressions (CTEs), Window Functions (`ROW_NUMBER()`), Multi-table `JOIN` operations, Subqueries, and Aggregate Functions.


* **Tables Analyzed:** `employee`, `invoice`, `customer`, `invoice_line`, `track`, `genre`, `artist`, and `album`.



## 📊 Business Problems Solved

The analysis is structured into three tiers of complexity, designed to answer specific business questions:

### Phase 1: Foundational Analysis (Easy Level)



* **Organizational Structure:** Identified the most senior employee based on job title and levels.


* **Sales Distribution:** Analyzed global sales distribution to determine which billing countries generate the highest volume of invoices.


* **Event Planning:** Pinpointed the billing city with the highest overall invoice total to strategically recommend the best location for a promotional event.


* **Customer Valuation:** Calculated and identified the single highest-spending customer in the database.



### Phase 2: Targeted Demographics (Moderate Level)



* **Audience Segmentation:** Extracted the distinct email addresses and names of all customers who purchase 'Rock' music for targeted marketing campaigns.


* **Artist Performance:** Ranked the top 10 Rock artists based on their total track count.


* **Product Analysis:** Utilized subqueries to filter and identify all track names that exceed the average track length in milliseconds.



### Phase 3: Advanced Business Intelligence (Advanced Level)



* **Customer-Artist Revenue:** Engineered Common Table Expressions (CTEs) to calculate exactly how much total money each individual customer has spent on specific artists.


* **Regional Genre Popularity:** Applied complex window functions (`ROW_NUMBER() OVER(PARTITION BY...)`) to determine the most popular music genre for each individual country based on actual purchase volume.


* **Top Regional Spenders:** Developed an advanced query utilizing CTEs and window partitioning to identify the single top-spending customer within every country.



## 📹 Video Walkthrough

**[👉 Click here to watch my full project walkthrough video on Google Drive](https://www.google.com/search?q=PASTE_YOUR_GOOGLE_DRIVE_LINK_HERE)**
