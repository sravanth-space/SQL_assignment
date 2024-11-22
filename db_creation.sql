-- Create Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    email TEXT,
    loyalty_points INTEGER
);

-- Create Products Table
CREATE TABLE IF NOT EXISTS Products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    product_brand TEXT,
    product_price REAL NOT NULL,
    product_rating REAL
);

-- Create Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER NOT NULL,
    total_price REAL NOT NULL,
    order_status TEXT,
    feedback_rating TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Create Shipping Table
CREATE TABLE IF NOT EXISTS Shipping (
    shipping_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    shipping_method TEXT,
    shipping_cost REAL,
    discount_applied REAL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) 
);

-- Create Customer Behavior Table
CREATE TABLE IF NOT EXISTS CustomerBehavior (
    behavior_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    cart_abandonment BOOLEAN,
    customer_segment TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
