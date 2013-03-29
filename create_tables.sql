CREATE TABLE chefs (
id INTEGER PRIMARY KEY,
first_name VARCHAR(40),
last_name VARCHAR(40),
mentor INTEGER
);

CREATE TABLE restaurants (
id INTEGER PRIMARY KEY,
name VARCHAR(40), 
neighborhood VARCHAR(60),
cuisine VARCHAR(60)
);

CREATE TABLE chef_tenures (
id INTEGER PRIMARY KEY,
chef_id INTEGER,
restaurant_id INTEGER,
start_time TEXT,
end_time TEXT,
head_chef INTEGER,

CHECK (head_chef IN (0, 1)),
FOREIGN KEY (chef_id) REFERENCES chefs(id),
FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

CREATE TABLE critics (
id INTEGER PRIMARY KEY,
name VARCHAR(40)
);

CREATE TABLE restaurant_reviews (
id INTEGER PRIMARY KEY,
critic_id INTEGER,
restaurant_id INTEGER,
review TEXT,
score INTEGER,
date_time TEXT,

CHECK ( score <= 20 ),
FOREIGN KEY (critic_id) REFERENCES critics(id),
FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);





