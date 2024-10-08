CREATE DATABASE db_appfood;
USE db_appfood;

CREATE TABLE users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	pass_word VARCHAR(255)
);


INSERT INTO users (full_name, email, pass_word) VALUES
	('John Doe', 'johndoe@example.com', 'password123'),
    ('Jane Smith', 'janesmith@example.com', 'secret123'),
    ('Alice Johnson', 'alicejohnson@example.com', 'strongpassword'),
    ('Bob Williams', 'bobwilliams@example.com', 'password456'),
    ('Carol Davis', 'carol davis@example.com', 'secret789'),
    ('David Miller', 'davidmiller@example.com', 'password1234'),
    ('Emily Taylor', 'emilytaylor@example.com', 'secret4567'),
    ('Frank Thomas', 'frankthomas@example.com', 'password8901'),
    ('Grace Lee', 'gracelee@example.com', 'secret2345'),
    ('Henry Hill', 'henryhill@example.com', 'password6789'),
    ('Nguyen Van A', 'nguyenvanA@example.com', '123456');
    
    
    
CREATE TABLE food_type (
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
);

CREATE TABLE foods (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	description VARCHAR(255),
	type_id INT,
	
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);


INSERT INTO food_type (type_name) VALUES
    ('Appetizer'),
    ('Main Course'),
    ('Dessert'),
    ('Drink'),
    ('Side Dish');
    
    
INSERT INTO foods (food_name, image, price, description, type_id) VALUES
    ('Caesar Salad', 'caesar_salad.jpg', 12.99, 'A classic salad with romaine lettuce, croutons, and Caesar dressing.', 1),
    ('Grilled Chicken', 'grilled_chicken.jpg', 15.99, 'Grilled chicken breast served with your choice of side.', 2),
    ('Chocolate Cake', 'chocolate_cake.jpg', 8.99, 'A rich chocolate cake with vanilla frosting.', 3),
    ('Coca-Cola', 'coca_cola.jpg', 2.99, 'A refreshing carbonated drink.', 4),
    ('French Fries', 'french_fries.jpg', 4.99, 'Crispy French fries served with ketchup.', 5),
    ('Bruschetta', 'bruschetta.jpg', 9.99, 'Grilled bread topped with tomatoes, basil, and olive oil.', 1),
    ('Pasta Carbonara', 'pasta_carbonara.jpg', 13.99, 'Pasta with bacon, eggs, and cheese.', 2),
    ('Ice Cream Sundae', 'ice_cream_sundae.jpg', 6.99, 'Vanilla ice cream with chocolate syrup, nuts, and whipped cream.', 3),
    ('Coffee', 'coffee.jpg', 3.99, 'A hot or iced coffee beverage.', 4),
    ('Mashed Potatoes', 'mashed_potatoes.jpg', 3.99, 'Creamy mashed potatoes.', 5),
    ('Shrimp Cocktail', 'shrimp_cocktail.jpg', 10.99, 'Cooked shrimp served with cocktail sauce.', 1),
    ('Steak', 'steak.jpg', 24.99, 'Grilled steak served with your choice of side.', 2),
    ('Apple Pie', 'apple_pie.jpg', 7.99, 'A classic apple pie with a flaky crust.', 3),
    ('Tea', 'tea.jpg', 3.99, 'A hot or iced tea beverage.', 4),
    ('Green Beans', 'green_beans.jpg', 3.99, 'Steamed green beans.', 5);


CREATE TABLE sub_food (
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255),
	sub_price FLOAT,
	food_id INT,
	
	FOREIGN KEY (food_id) REFERENCES foods(food_id)
);

INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
    ('Extra Cheese', 1.99, 1),
    ('Extra Dressing', 0.99, 1),
    ('Grilled Chicken', 3.99, 2),
    ('Garlic Bread', 2.99, 2),
    ('Chocolate Ice Cream', 1.99, 3),
    ('Vanilla Ice Cream', 1.99, 3),
    ('Diet Coke', 0.99, 4),
    ('Sprite', 0.99, 4),
    ('Sour Cream', 0.99, 5),
    ('Butter', 0.99, 5);
    
    
CREATE TABLE orders (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT, 
	food_id INT,
	amount INT,
	code VARCHAR(50),
	arr_sub_id VARCHAR(50),
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (food_id) REFERENCES foods(food_id)
); 


INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
    (1, 1, 2, 'ORDER123', '[1]'),
    (2, 2, 1, 'ORDER456', '[2]'),
    (3, 3, 3, 'ORDER789', '[3, 4]'),
    (4, 4, 2, 'ORDER101', '[5]'),
    (5, 5, 1, 'ORDER111', '[6]'),
    (6, 6, 3, 'ORDER122', '[7, 8]'),
    (7, 7, 2, 'ORDER133', '[9]'),
    (8, 8, 1, 'ORDER144', '[10]'),
    (9, 9, 3, 'ORDER155', '[11, 12]'),
    (10, 10, 2, 'ORDER166', '[13]'),
    (1, 11, 1, 'ORDER177', '[14]'),
    (2, 12, 3, 'ORDER188', '[15, 16]'),
    (3, 13, 2, 'ORDER199', '[17]'),
    (4, 14, 1, 'ORDER200', '[18]'),
    (5, 15, 3, 'ORDER211', '[19, 20]'),
    (6, 1, 2, 'ORDER222', '[1]'),
    (7, 2, 1, 'ORDER233', '[2]'),
    (8, 3, 3, 'ORDER244', '[3, 4]'),
    (9, 4, 2, 'ORDER255', '[5]'),
    (10, 5, 1, 'ORDER266', '[6]');
    
    
    
CREATE TABLE restaurants(
	res_id INT PRIMARY KEY  AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	description VARCHAR(255)

);

INSERT INTO restaurants (res_name, image, description) VALUES
    ('The Pizza Place', 'pizza_place.jpg', 'A cozy pizzeria serving delicious handmade pizzas.'),
    ('Burger King', 'burger_king.jpg', 'A fast-food chain known for its burgers and fries.'),
    ('Sushi Bar', 'sushi_bar.jpg', 'A Japanese restaurant specializing in fresh sushi and sashimi.'),
    ('Italian Bistro', 'italian_bistro.jpg', 'A casual Italian restaurant serving pasta, pizza, and seafood.'),
    ('French Bakery', 'french_bakery.jpg', 'A bakery offering a variety of French pastries and bread.'),
    ('Indian Curry House', 'indian_curry_house.jpg', 'An Indian restaurant serving authentic curries and tandoori dishes.'),
    ('Mexican Taqueria', 'mexican_taqueria.jpg', 'A Mexican restaurant serving tacos, burritos, and quesadillas.'),
    ('Chinese Dim Sum House', 'chinese_dim_sum_house.jpg', 'A Chinese restaurant serving dim sum and other traditional dishes.'),
    ('Vietnamese Pho House', 'vietnamese_pho_house.jpg', 'A Vietnamese restaurant specializing in pho and other Vietnamese cuisine.'),
    ('Thai Noodle Shop', 'thai_noodle_shop.jpg', 'A Thai restaurant serving various noodle dishes and curries.'),
    ('Korean BBQ Grill', 'korean_bbq_grill.jpg', 'A Korean restaurant where you grill your own meat at the table.'),
    ('American Steakhouse', 'american_steakhouse.jpg', 'A steakhouse serving high-quality steaks and other American classics.'),
    ('Mediterranean Grill', 'mediterranean_grill.jpg', 'A Mediterranean restaurant serving grilled meats, salads, and falafel.'),
    ('Japanese Ramen House', 'japanese_ramen_house.jpg', 'A Japanese restaurant specializing in ramen noodles.'),
    ('Vegan Cafe', 'vegan_cafe.jpg', 'A vegan cafe offering a variety of plant-based dishes and drinks.');


CREATE TABLE rate_res (
	rate_res_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	res_id INT,
	amount INT,
	date_rate DATETIME,
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id)
);

INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
    (1, 1, 5, '2023-12-25 10:00:00'),
    (2, 2, 4, '2023-12-26 12:00:00'),
    (3, 3, 3, '2023-12-27 14:00:00'),
    (4, 4, 5, '2023-12-28 16:00:00'),
    (5, 5, 4, '2023-12-29 18:00:00'),
    (6, 6, 3, '2023-12-30 20:00:00'),
    (7, 7, 5, '2024-01-01 08:00:00'),
    (8, 8, 4, '2024-01-02 10:00:00'),
    (9, 9, 3, '2024-01-03 12:00:00'),
    (10, 10, 5, '2024-01-04 14:00:00');
    
CREATE TABLE like_res (
	like_res_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	res_id INT,
	date_like DATETIME,
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id)
);


INSERT INTO like_res (user_id, res_id, date_like) VALUES
	(1, 1, '2023-12-25 10:00:00'),
    (2, 2, '2023-12-26 12:00:00'),
    (3, 3, '2023-12-27 14:00:00'),
    (4, 4, '2023-12-28 16:00:00'),
    (5, 5, '2023-12-29 18:00:00'),
    (6, 6, '2023-12-30 20:00:00'),
    (7, 7, '2024-01-01 08:00:00'),
    (8, 8, '2024-01-02 10:00:00'),
    (9, 9, '2024-01-03 12:00:00'),
    (10, 10, '2024-01-04 14:00:00'),
    (1, 11, '2024-01-05 16:00:00'),
    (2, 12, '2024-01-06 18:00:00'),
    (3, 13, '2024-01-07 20:00:00'),
    (4, 14, '2024-01-08 08:00:00'),
    (5, 15, '2024-01-09 10:00:00'),
    (6, 1, '2024-01-10 12:00:00'),
    (7, 2, '2024-01-11 14:00:00'),
    (8, 3, '2024-01-12 16:00:00'),
    (9, 4, '2024-01-13 18:00:00'),
    (10, 5, '2024-01-14 20:00:00'),
    (9, 1, '2024-08-22 18:00:00'),
    (9, 3, '2024-02-12 16:00:00'),
    (9, 2, '2024-03-12 16:00:00'),
    (7, 2, '2024-03-12 16:00:00'),
    (7, 3, '2024-03-12 16:00:00'),
    (7, 4, '2024-03-12 16:00:00'),
    (7, 6, '2024-03-12 16:00:00'),
    (7, 10, '2024-03-12 16:00:00'),
    (7, 8, '2024-03-12 16:00:00'),
    (3, 1, '2023-12-27 14:00:00'),
    (3, 2, '2023-12-27 14:00:00'),
    (3, 7, '2023-12-27 14:00:00');
    
-- Tìm 5 người đã like nhà hàng nhiều nhất.
SELECT COUNT(like_res.user_id) AS 'Số lượt like', like_res.user_id, users.user_id, users.full_name, users.pass_word
FROM like_res
INNER JOIN users on users.user_id = like_res.user_id
GROUP BY like_res.user_id
ORDER BY `Số lượt like` DESC
LIMIT 5


-- Tìm 2 nhà hàng có lượt like nhiều nhất.
SELECT COUNT(like_res.res_id) AS 'Số lượt like', like_res.res_id, restaurants.res_id, restaurants.res_name
FROM like_res
INNER JOIN restaurants on restaurants.res_id = like_res.res_id
GROUP BY like_res.res_id
ORDER BY `Số lượt like` DESC
LIMIT 2

-- Tìm người đã đặt hàng nhiều nhất.
SELECT COUNT(orders.user_id) AS "Số lần mua", users.full_name, users.email
FROM orders
INNER JOIN users on orders.user_id = users.user_id
GROUP BY orders.user_id
ORDER BY `Số lần mua` DESC
LIMIT 1

-- Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng)

SELECT *
FROM users
LEFT JOIN orders on orders.user_id = users.user_id
LEFT JOIN like_res on like_res.user_id = users.user_id
LEFT JOIN rate_res on rate_res.user_id = users.user_id
WHERE orders.user_id is NULL AND like_res.user_id is NULL AND rate_res.user_id is NULL