select * from sales

select * from product

select * from customer

--1) create a report of all state sales, quantity, discount, profit, with following aggregation sucha as sum, avg, min, max, count

select c.state,
sum(s.sales) AS total_sales,
avg(s.sales) AS avg_sales,
min(s.sales) AS min_sales,
max(s.sales) AS max_sales,
count(s.sales) AS count_sales,

sum(s.quantity) AS total_quantity,
avg(s.quantity) AS avg_quantity,
min(s.quantity) AS min_quantity,
max(s.quantity) AS max_quantity,
count(s.quantity) AS count_quantity,
	
sum(s.discount) AS total_discount,
avg(s.discount) AS avg_discount,
min(s.discount) AS min_discount,
max(s.discount) AS max_discount,
count(s.discount) AS count_discount,
	
sum(s.profit) AS total_profit,
avg(s.profit) AS avg_profit,
min(s.profit) AS min_profit,
max(s.profit) AS max_profit,
count(s.profit) AS count_profit from  sales as s
	
inner join customer as c
on s.customer_id = c.customer_id
group by c.state


----2) get data of all state and city avg customer age

select state, city, avg(age) as "avg_age" from customer group by state, city order by avg(age)

----3) get data of 2017 to 2018 with product name and sales per quantity

select p.product_name, s.order_date, sum(s.sales)/sum(s.quantity) as "sales_per_quantity" from sales as s
inner join product as p
on s.product_id = p.product_id
where s.order_date between '2017-01-01' and '2018-12-31'
group by p.product_name, s.order_date

