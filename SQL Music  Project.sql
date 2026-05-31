# 1. Easy Level Queries:

### Q1: Find the most senior employee based on job title.
SELECT * FROM music.employee
order by levels desc;

### Q2: Determine which countries have the most invoices.
select count(*) as total_count,
billing_country
from invoice
group by billing_country
order by total_count;

### Q3: Identify the top 3 invoice totals.
select  round(total,2) as top_3_invoices  from invoice
order by total desc
limit 3;

### Q4: Find the city with the highest total invoice amount to determine the best location for a promotional event.
select 
round(sum(total),2) as Highest_totals,
billing_city
from invoice
group by billing_city
order by Highest_totals desc;

### Q5: Identify the customer who has spent the most money
SELECT c.customer_id, c.first_name, round(SUM(i.total),2) as most_spend
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id,c.first_name,c.last_name
ORDER BY most_spend DESC;

# 2. Moderate Level Queries:

### Q1: Find the email, first name, and last name of customers who listen to Rock music.
SELECT 
DISTINCT c.email, 
c.first_name, 
c.last_name
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN genre g ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
ORDER BY c.email;

### Q2: Identify the top 10 rock artists based on track count.
select 
distinct ar.name,
ar.artist_id
from artist as ar join album  as al on 
ar.artist_id = al.artist_id join 
track as t on al.album_id = t.album_id join 
genre as g on t.genre_id = g.genre_id 
where g.name = "Rock"
order by ar.name 
limit 10;

### Q3: Find all track names that are longer than the average track length.
select
name, 
milliseconds 
from track
where milliseconds > (select avg(milliseconds) 
from  track)
order by  name;

# 3. Advanced Level Queries:

### Q1: Calculate how much each customer has spent on each artist.

## creating CTE for
with artist_sales as (
select 
il.invoice_id,
ar.artist_id,
ar.name as artist_name,
(il.unit_price * il.quantity) as line_total
FROM invoice_line il
JOIN track t ON il.track_id = t.track_id
JOIN album al ON t.album_id = al.album_id
JOIN artist ar ON al.artist_id = ar.artist_id
)
## Join the CTE with customer and invoice
select 
c.customer_id,
c.first_name,
c.last_name,
cte.artist_name,
ROUND(SUM(cte.line_total), 2) as total_spent
from customer c
join invoice i on c.customer_id = i.customer_id
join artist_sales cte ON i.invoice_id = cte.invoice_id
group by  c.customer_id,c.first_name,c.last_name,cte.artist_id,cte.artist_name
order by  c.customer_id, total_spent DESC;

### Q2: Determine the most popular music genre for each country based on purchases.(run the whole query togather)
with  popular_genre as (
select
c.country, 
g.name as genre_name, 
COUNT(il.invoice_line_id) AS purchases,
row_number() over(partition by c.country order by COUNT(il.invoice_line_id) desc) as genre_rank
from customer c
join invoice i on c.customer_id = i.customer_id
join invoice_line il on i.invoice_id = il.invoice_id
join track t on il.track_id = t.track_id
JOIN genre g on t.genre_id = g.genre_id
group by  c.country,g.name)

select
country, 
genre_name, 
purchases
from  popular_genre
where genre_rank = 1
order by country asc;

### Q3: Identify the top-spending customer for each country( run the entire query for the results)

with  customer_spending as (
select c.customer_id, 
c.first_name, 
c.last_name, 
c.country, 
sum(i.total) as total_spent,
row_number() over(partition by c.country order by  SUM(i.total) desc) as spending_rank
from customer c
join invoice i on c.customer_id = i.customer_id
group by c.customer_id, c.first_name, c.last_name, c.country)
select 
country, 
customer_id,
first_name, 
last_name, 
round(total_spent,2) as total_spend
from  customer_spending
where spending_rank = 1
order by country asc;

----- X ---- X ----- X ----- X ----- X----- 
 