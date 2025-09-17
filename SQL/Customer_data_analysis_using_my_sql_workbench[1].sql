use project_customer_segmentation;
select * from customer;
# Cleaning Process
# Removing Duplicates
select distinct * from customer; 
# Handling Null Values
select * from customer where null;
# Count & Disticts
select count(*) from customer;
select count(distinct invoice_no) from customer;
select count(distinct customer_id) from customer;
select count(distinct gender) from customer;
select count(distinct age) from customer;
select count(distinct category) from customer;
select count(distinct quantity) from customer;
select count(distinct price) from customer;
select count(distinct payment_method) from customer;
select count(distinct invoice_date) from customer;
select count(distinct shopping_mall) from customer;
# Checking Negative/Zero Values
select sum(age<=0),sum(quantity<=0),sum(price<=0) from customer;
# Shopping Distribution According To Gender
select gender,
count(customer_id)
from customer group by gender
order by gender desc;
# Which Gender Bought More Products
select gender,
count(quantity)
from customer
group by gender
order by gender desc;
# Which Gender Generated More Revenue
select gender,
sum(quantity*price)
from customer
group by gender
order by gender desc;
# Purchase Category Relative To quantity
select category,
sum(quantity) 
from customer
group by category
order by category desc;
# Shopping Distribution Accroding To Age
select age,
count(quantity)
from customer
group by age
order by age desc;
# Which Age Group Buys More Products
select age,
sum(quantity)
from customer 
group by age
order by age desc;
# Which Age Groups Generated More Revenue
select age,
sum(quantity*price)
from customer
group by age
order by age desc;
# Purchase Category Related To Other Columns 
# Category vs Gender
select category,gender,
sum(quantity*price),
sum(quantity)
from customer
group by category,gender
order by category,sum(quantity*price) desc;
# Category vs Age Group
select category,age,
sum(quantity*price)
from customer
group by category,age
order by category,sum(quantity*price) desc;
# Category vs Payment Method
select category,payment_method,
sum(quantity*price)
from customer
group by category,payment_method
order by category,sum(quantity*price) desc;
# Payment Method Relation To Other Columns
# Payment Method vs Gender
select payment_method,gender,
sum(quantity)
from customer
group by payment_method,gender
order by payment_method;
# Payment Method vs Age
select payment_method,age,
sum(quantity)
from customer
group by payment_method,age
order by payment_method;
# Distribution Of Payment Method
select payment_method,
count(price)
from customer
group by payment_method
order by count(price) desc;
# Mall-Wise Revenue
select shopping_mall,
sum(quantity*price)
from customer
group by shopping_mall
order by sum(quantity*price);
# Monthly Revenue Trend
select invoice_date,
sum(price),sum(quantity)
from customer
group by invoice_date
order by invoice_date;
# Top Category By Revenue Within Each Mall
select shopping_mall,category,
sum(quantity*price)
from customer
group by shopping_mall,category
order by shopping_mall,sum(quantity*price);
# Top Customer By Revenue
select customer_id,
sum(quantity*price)
from customer
group by customer_id
order by customer_id;

