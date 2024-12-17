create database sqlproject1;
use sqlproject1;
create table retail_sales (transactions_id	int primary key,
sale_date date,	
sale_time time,
customer_id	int,
gender varchar(90),	
age	int,
category  varchar(90),
	quantiy int,
	price_per_unit	float,
    cogs	float,
    total_sale float
    );
select * from retail_sales;
select count(*) from retail_sales;


SELECT * from retail_sales
WHERE transactions_id IS NULL or
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantiy IS NULL OR price_per_unit IS NULL OR cogs IS NULL or  total_sale IS NULL;
    
#data exploration

#ho many sales we have 
select count(*) as total_sales from retail_sales;

#how many customer we have 

select count(distinct customer_id) as total_sales from retail_sales;
#how many category we have 
select distinct category as total_category from retail_sales;

# Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- #Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sales
where sale_date='2022-11-05';

-- #Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select * from retail_sales
where category='clothing'
and quantiy>4 
and sale_date between 2022-11-01 and 2022-11-30;

#Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select sum(total_sale),category from retail_sales
group by category;

-- #Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select avg(age),category from retail_sales
where category='beauty';

-- #Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales
where total_sale>=1000;


-- #Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select count(transactions_id),gender,category from retail_sales
group by gender,category;

-- #Q.7 Write a SQL query to find the top 5 customers based on the highest total sales
select sum(total_sale),customer_id as top_5_customers from retail_sales 
group by customer_id
order by customer_id desc
limit 5;

 -- Q.8 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT category,count(distinct customer_id)  as unique_customers from retail_sales
group by category;
    









 



