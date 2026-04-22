create table customers (
	customer_id serial primary key,
	name varchar(100),
	email varchar(100),
	city varchar(50),
	signup_date date
);

create table products(
	product_id serial primary key,
	product_name varchar(100),
	category varchar(50),
	price numeric(10,2)
);

create table orders(
	order_id serial primary key,
	customer_id int references customers(customer_id),
	order_date date,
	status varchar(20)
);

create table order_item(
	order_item_id serial primary key,
	order_id int references orders(order_id),
	product_id int references products(product_id),
	quantity int
);

alter table order_item
rename to order_items;

select * from orders

INSERT INTO customers (customer_id, name, email, city, signup_date)
VALUES
(1,'Amit','amit@gmail.com','Mumbai','2025-01-01'),
(2,'Riya','riya@gmail.com','Delhi','2025-01-05'),
(3,'John','john@gmail.com','Pune','2025-01-10'),
(4,'Sara','sara@gmail.com','Bangalore','2025-01-12'),
(5,'Raj','raj@gmail.com','Mumbai','2025-01-15'),
(6,'Neha','neha@gmail.com','Delhi','2025-01-18'),
(7,'Arjun','arjun@gmail.com','Pune','2025-01-20'),
(8,'Priya','priya@gmail.com','Mumbai','2025-01-22'),
(9,'Karan','karan@gmail.com','Bangalore','2025-01-25'),
(10,'Meena','meena@gmail.com','Delhi','2025-01-28'),
(11,'Vikas','vikas@gmail.com','Mumbai','2025-02-01'),
(12,'Anita','anita@gmail.com','Pune','2025-02-03'),
(13,'Rohit','rohit@gmail.com','Delhi','2025-02-05'),
(14,'Simran','simran@gmail.com','Mumbai','2025-02-07'),
(15,'Ayesha','ayesha@gmail.com','Bangalore','2025-02-10'),
(16,'Manoj','manoj@gmail.com','Delhi','2025-02-12'),
(17,'Pooja','pooja@gmail.com','Pune','2025-02-14'),
(18,'Nikhil','nikhil@gmail.com','Mumbai','2025-02-16'),
(19,'Sneha','sneha@gmail.com','Bangalore','2025-02-18'),
(20,'Rahul','rahul@gmail.com','Delhi','2025-02-20');


INSERT INTO products (product_id, product_name, category, price) VALUES
(1,'Laptop','Electronics',55000),
(2,'Phone','Electronics',20000),
(3,'Shoes','Clothing',3000),
(4,'T-shirt','Clothing',800),
(5,'Sofa','Home',25000),
(6,'Table','Home',7000),
(7,'Cricket Bat','Sports',2000),
(8,'Football','Sports',1500),
(9,'Headphones','Electronics',2500),
(10,'Watch','Accessories',4000),
(11,'Bag','Accessories',1200),
(12,'Jeans','Clothing',2200),
(13,'Microwave','Home',10000),
(14,'TV','Electronics',45000),
(15,'Keyboard','Electronics',1500),
(16,'Mouse','Electronics',800),
(17,'Bed','Home',30000),
(18,'Jacket','Clothing',3500),
(19,'Cycle','Sports',12000),
(20,'Dumbbells','Sports',2500);


INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(1,1,'2025-03-01','delivered'),
(2,2,'2025-03-02','pending'),
(3,3,'2025-03-03','delivered'),
(4,4,'2025-03-04','cancelled'),
(5,5,'2025-03-05','delivered'),
(6,6,'2025-03-06','pending'),
(7,7,'2025-03-07','delivered'),
(8,8,'2025-03-08','delivered'),
(9,9,'2025-03-09','cancelled'),
(10,10,'2025-03-10','delivered'),
(11,11,'2025-03-11','pending'),
(12,12,'2025-03-12','delivered'),
(13,13,'2025-03-13','delivered'),
(14,14,'2025-03-14','pending'),
(15,15,'2025-03-15','delivered'),
(16,16,'2025-03-16','cancelled'),
(17,17,'2025-03-17','delivered'),
(18,18,'2025-03-18','pending'),
(19,19,'2025-03-19','delivered'),
(20,20,'2025-03-20','delivered');


INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1,1,1,1),
(2,2,2,2),
(3,3,3,1),
(4,4,4,3),
(5,5,5,1),
(6,6,6,2),
(7,7,7,1),
(8,8,8,2),
(9,9,9,1),
(10,10,10,1),
(11,11,11,2),
(12,12,12,1),
(13,13,13,1),
(14,14,14,1),
(15,15,15,2),
(16,16,16,3),
(17,17,17,1),
(18,18,18,2),
(19,19,19,1),
(20,20,20,1);



select * from customers
---Find total number of customers in each city.
select city, count(customer_id) as total_customer from customers
group by city;

---Get all customers from Mumbai.
select * from customers 
where city='Mumbai';

---Find all orders placed after 2025-03-10.
select * from orders
where order_date > '2025-03-10';

---Get all products with price greater than 5000.
select product_id, product_name, price from products 
where price > 5000;

---Find all delivered orders.
select * from orders
where status ='delivered';

---Find total number of orders.
select count(order_id) from orders;

---Find average product price.
select avg(price) from products;

---Find total quantity sold.
select sum(quantity) from order_items;

---Find maximum and minimum product price.
select max(price) as maximum_price, min(price) as minimum_price from products;

---Find total revenue (quantity × price).
select sum(oi.quantity * p.price) as total_revenue
from order_items oi
join products p
on oi.product_id=p.product_id;

---Find number of customers per city.
select city, count(customer_id) as number_of_customer from customers
group by city;

---Find number of orders per status.
select count(order_id) as number_of_order, status from orders
group by status;

---Find total revenue per product.
select sum(oi.quantity * p.price) as total_revenue, product_name
from order_items oi
join products p
on oi.product_id=p.product_id
group by product_name ;

---Find total quantity sold per category.
select sum(oi.quantity) as total_quantity, p.category
from order_items oi
join products p
on oi.product_id=p.product_id
group by category

---Find total orders per customer.
select count(o.order_id) as total_order, c.name
from orders o
join customers c
on o.customer_id=c.customer_id
group by name;

---Get all orders with customer name.
select o.order_id, name, oi.quantity
from orders o
inner join customers c
on o.customer_id=c.customer_id
join order_items oi
on o.order_id=oi.order_id
group by name, o.order_id, oi.quantity;


---Get order details with product name.
select oi.order_id, oi.product_id, p.product_name,o.status,o.order_date
from order_items oi
join products p
on oi.product_id=p.product_id
join orders o
on oi.order_id=o.order_id
group by oi.order_id, oi.product_id,p.product_name,o.status,o.order_date;

---Find total revenue per customer.
select c.customer_id, c.name, sum(oi.quantity * p.price) as total_revenue
from customers c
join orders o
on c.customer_id=o.customer_id
join order_items oi
on o.order_id=oi.order_id
join products p
on oi.product_id=p.product_id
group by c.customer_id,c.name;


---Find top 3 customers by total spending.
select c.customer_id, c.name, sum(oi.quantity * p.price) as total_revenue
from customers c
join orders o
on c.customer_id=o.customer_id
join order_items oi
on o.order_id=oi.order_id
join products p
on oi.product_id=p.product_id
group by c.customer_id,c.name
order by total_revenue desc
limit 3;

---Find most sold product (by quantity).
select p.product_id,p.product_name,oi.quantity
from products p
join order_items oi
on p.product_id=oi.product_id
group by p.product_name,p.product_id,oi.quantity
order by oi.quantity desc;










select * from orders