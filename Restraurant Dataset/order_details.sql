Select *
From order_details;

-- Date range of the table
Select Min(order_date), Max(order_date)
From order_details;

-- How many orders were made within this date range
Select Count(Distinct order_id) as Num_Orders
From order_details;

-- How many items were ordered
Select Count(*) as Num_Item_Orders
From order_details; 

-- Which orders had the most number of Items
Select order_id, count(item_id) as Num_Items
From order_details
Group by order_id
Order by Num_Items Desc;

-- How many orders had more than 12 items

Select Count(*) From
(Select order_id, count(item_id) as Num_Items
From order_details
Group by order_id
Having Num_Items>12) as Num_Orders;
