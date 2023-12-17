-- 1-Write an SQL query to retrieve warehouse id, city, and count of orders shipped from this warehouse. The query should show all warehouses even if there are no orders that have been shipped from this warehouse.
select w.warehouse_id , w.warehouse_city , count(s.order_id)
from warehouse as w
left join shipment as s on s.warehouse_id=w.warehouse_id
group by w.warehouse_id , w.warehouse_city;

-- 2-Write a SQL query to retrieve customer name, count of orders for each customer even if the customer didn’t make any orders.
select c.customer_name,count(o.order_id)
from customer as c 
left join orderr as o on o.customer_id=c.customer_id
group by c.customer_id,c.customer_name;

-- 3-Write a SQL query to retrieve all items who haven’t been ordered.
SELECT i.item_id, i.unit_price
FROM item i 
LEFT JOIN order_item oi ON i.item_id = oi.item_id 
WHERE oi.order_id IS NULL;
