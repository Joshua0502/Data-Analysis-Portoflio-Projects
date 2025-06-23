-- Combine menu_items and order_detals into single table
Select *
From order_details od
Left Join menu_items mi
	on od.item_id = mi.menu_item_id;

-- what were the least and most ordered items

Select mi.item_name, count(order_details_id) as num_purchase
From order_details od
Left Join menu_items mi
	on od.item_id = mi.menu_item_id
Group by mi.item_name
Order by num_purchase;

Select mi.item_name, count(order_details_id) as num_purchase
From order_details od
Left Join menu_items mi
	on od.item_id = mi.menu_item_id
Group by mi.item_name
Order by num_purchase Desc;

-- What categories were the least and most ordered items in

Select mi.item_name, count(order_details_id) as num_purchase
From order_details od
Left Join menu_items mi
	on od.item_id = mi.menu_item_id
Group by mi.item_name
Order by num_purchase;

Select mi.item_name, category, count(order_details_id) as num_purchase
From order_details od
Left Join menu_items mi
	on od.item_id = mi.menu_item_id
Group by mi.item_name, category
Order by num_purchase Desc;

-- Top 5 orders that spent the most money
Select od.order_id, sum(mi.price) as Tot_Spend
From order_details od
Left Join menu_items mi
	on od.item_id = mi.menu_item_id
Group by od.order_id
Order by Tot_Spend Desc
Limit 5;

-- View details of the higest spend order
Select category, count(item_id) as num_items
From order_details od
Left Join menu_items mi
	on od.item_id = mi.menu_item_id
Where od.order_id = 440
Group by category;

440	192.15
2075	191.05
1957	190.10
330	189.70
2675	185.10

Select category, order_id, count(item_id) as num_items
From order_details od
Left Join menu_items mi
	on od.item_id = mi.menu_item_id
Where od.order_id In (440, 2075, 1957, 330, 2675)
Group by order_id, category;



