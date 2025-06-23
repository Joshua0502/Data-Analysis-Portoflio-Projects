Use restaurant_db;

-- Veiw items in menu_items teble
Select * 
from menu_items;

-- Number if items witin the menu
Select COUNT(*) as NumberOfItems
From menu_items;

-- Least and most expensive items on the menu
Select *
From menu_items
Order by price;

Select *
From menu_items
Order by price Desc;

-- How many Italian dishes are on the menu
Select Count(*) as NumberOfItalianDishes 
from menu_items
where category='Italian';

Select item_name from menu_items
where category='Italian';

-- Least and Most expensive Italian Dishe
Select *
From menu_items
where category='Italian'
Order by price;

Select *
From menu_items
where category='Italian'
Order by price Desc;

-- How many dishes are in each category

Select category, count(item_name) as num_Dishes 
from menu_items
Group by category;

-- Average dish price within each category
Select category, avg(price) as avg_price
From menu_items
group by category
Order by avg_price Desc;