CREATE DATABASE order_processing_system
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    city VARCHAR(255)
);

CREATE TABLE orderr (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


CREATE TABLE item (
    item_id INT PRIMARY KEY,
    unit_price DECIMAL(10, 2)
);

CREATE TABLE order_item (
    order_id INT,
    item_id INT,
    quantity INT,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES orderr(order_id),
    FOREIGN KEY (item_id) REFERENCES item(item_id)
);

CREATE TABLE warehouse (
    warehouse_id INT PRIMARY KEY,
    warehouse_city VARCHAR(255)
);

CREATE TABLE shipment (
    order_id INT,
    warehouse_id INT,
    ship_date DATE,
    PRIMARY KEY (order_id, warehouse_id),
    FOREIGN KEY (order_id) REFERENCES orderr(order_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id)
);


