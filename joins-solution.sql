# prime-group-joins

--1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" 
ON "addresses".customer_id = "customers".id;

--2. Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders"
JOIN "line_items"
ON "orders".id = "line_items".order_id
JOIN "products"
ON "products".id = "line_items".product_id;

--3. Which warehouses have cheetos?
SELECT * FROM "warehouse"
JOIN "warehouse_product"
ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products"
ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'cheetos'
;

--4. Which warehouses have diet pepsi?
SELECT * FROM "warehouse"
JOIN "warehouse_product"
ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products"
ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi'
;

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".first_name, "customers".last_name, COUNT("line_items".order_id) FROM "customers"
JOIN "addresses"
ON "customers".id = "addresses".customer_id
JOIN "orders"
ON "addresses".id = "orders".address_id
JOIN "line_items"
ON "orders".id = "line_items".order_id
GROUP BY "customers".id
;

--6. How many customers do we have?
SELECT COUNT("customers") FROM "customers";

--7. How many products do we carry?
SELECT COUNT("products") FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product".on_hand), "products".description FROM "warehouse_product"
JOIN "products"
ON "products".id = "warehouse_product".product_id
WHERE "warehouse_product".product_id = 6
GROUP BY "products".description;
