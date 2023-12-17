-- 1. Write an SQL query to retrieve names of customers whose name starts with‘Ma’.
-- 2. Write an SQL query to retrieve count of items and total price of each order.
-- 3. Write an SQL query to retrieve order number for each order that had been 
-- shipped from warehouse in ‘Arica’.
-- 4. Write an SQL query to retrieve total price of orders that had been shipped 
-- from warehouse #8.
---------------------------------------------------------------------------------------
-- 1:
SELECT customer_name
FROM customer
WHERE customer_name LIKE 'Ma%';
--2
SELECT
    orderr.order_id,
    COUNT(order_item.item_id) AS item_count,
    SUM(item.unit_price * order_item.quantity) AS total_price
FROM
    orderr
JOIN order_item ON orderr.order_id = order_item.order_id
JOIN item ON order_item.item_id = item.item_id
GROUP BY
    orderr.order_id;
--3
SELECT orderr.order_id
FROM orderr
JOIN shipment ON orderr.order_id = shipment.order_id
JOIN warehouse ON shipment.warehouse_id = warehouse.warehouse_id
WHERE warehouse.warehouse_city = 'Arica';
--4
SELECT
    SUM(item.unit_price * order_item.quantity) AS total_price
FROM
    orderr
JOIN shipment ON orderr.order_id = shipment.order_id
JOIN order_item ON orderr.order_id = order_item.order_id
JOIN item ON order_item.item_id = item.item_id
WHERE shipment.warehouse_id = 8


