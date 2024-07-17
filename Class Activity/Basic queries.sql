use healthcare;
create table products(
id int auto_increment primary key ,
name varchar(50) not null
);
insert into products (name)
values(
'navneet'
);
INSERT INTO products (name) 
VALUES ('Laptop'),('Smartphone'),('Wireless Headphones');
select * from products;

create table favourites(
customer_id int,
product_id  int ,
favorite_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Primary key(customer_id,product_id)
);
insert into favourites  values (1,2,current_timestamp),(2,3,current_timestamp);
insert into favourites  values (1,3,current_timestamp);
select * from favourites;

create table tags(
id int,
name varchar(50)
);



select * from tags;
describe tags;
Alter table tags
add primary key(id);



create database fkdemo;
use fkdemo;

create table categories(
categoryId int primary key,
categoryName varchar(20)
);
create table products(
productId int primary key,
productName varchar(20),
categoryId int,
constraint fk_categories foreign key (categoryId)
						 references categories(categoryId)
);
select * from categories;
select * from products;

insert  into categories values(1,'abcd');
insert  into categories values(2,'der');
insert  into categories values(3,'abcd');

insert into products values(1,'nav',)