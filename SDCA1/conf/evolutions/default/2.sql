# --- Sample dataset
 
# --- !Ups

delete from category;
delete from item_on_sale;


insert into category (id,name) values ( 1,'Jackets');
insert into category (id,name) values ( 2,'Jumpers');
insert into category (id,name) values ( 3,'Trousers');
insert into category (id,name) values ( 4,'Shirts');

insert into item_on_sale (id,name,description,stock,price) values ( 1,'north nuptse','northface, black and grey camo ',27, 100.00 );
insert into item_on_sale (id,name,description,stock,price) values ( 2,'zip reflective','calvin klein',54,3.00 );
insert into item_on_sale (id,name,description,stock,price) values ( 3,'Hooded Core Jacket','Lyle & Scott  durable fabric',30,2.00 );
insert into item_on_sale (id,name,description,stock,price) values ( 4,'Core Lightweight Jacket','Emporio Armani EA7 made from durable poly',87,1.00 );

insert into item_on_sale (id,name,description,stock,price) values ( 10,'Mittelegi 1/4 Zip Hoodie','The North Face, light grey colourway that brightens up your fits',58,87.00 );
insert into item_on_sale (id,name,description,stock,price) values ( 11,'B-ball Overhead Hoodie','adidas Originals, made from soft cotton for an ultra-comfy wear',90, 100.00 );
insert into item_on_sale (id,name,description,stock,price) values ( 12,'Core Overhead Hoodie','Champion, chilled-out grey colourway',25,49.00 );
insert into item_on_sale (id,name,description,stock,price) values ( 13,'Nike Foundation Full Zip Hoodie','nike,a cosy cotton blend with ribbed trims',39,93.00 );

insert into item_on_sale (id,name,description,stock,price) values ( 19,'Rip Washed Skinny Jeans','Made from a stretchy cotton blend for a comfy fit and feel',77,50.00 );
insert into item_on_sale (id,name,description,stock,price) values ( 20,'Drake Twill Chino','Farah,  a navy colourway, they are built from stretchy cotton twill.',98,47.00 );
insert into item_on_sale (id,name,description,stock,price) values ( 21,'Essential Slim Leg Jeans','Supply & Demand, Built from stretch cotton in a black colourway',92, 66.00 );
insert into item_on_sale (id,name,description,stock,price) values ( 22,'Westend Pants','Columbia, Made from durable poly fabric in a blue grey colourway',93,100.00 );

insert into item_on_sale (id,name,description,stock,price) values ( 28,'Lyle & Scott Long Sleeve Oxford Shirt','made from a comfy cotton fabric',37,39.00 );
insert into item_on_sale (id,name,description,stock,price) values ( 29,'Farah Brewer Long Sleeve Shirt','Made from 100% cotton for a premium fit',31,40.00 );
insert into item_on_sale (id,name,description,stock,price) values ( 30,'Lyle & Scott Long Sleeve Oxford Shirt','In a white colourway, this shirt is made from cotton',91,29.00 );
insert into item_on_sale (id,name,description,stock,price) values ( 31,'Nanny State Long Sleeve Hinkly Shirt','made from an elastane blend, meaning the material is stretchy',75,39.00 );


insert into CATEGORY_ITEM_ON_SALE(category_id,item_on_sale_id) values (1,1);
insert into CATEGORY_ITEM_ON_SALE(category_id,item_on_sale_id) values (2,2);
insert into CATEGORY_ITEM_ON_SALE(category_id,item_on_sale_id) values (3,3);
insert into CATEGORY_ITEM_ON_SALE(category_id,item_on_sale_id) values (4,4);
insert into CATEGORY_ITEM_ON_SALE(category_id,item_on_sale_id) values (5,5);
insert into CATEGORY_ITEM_ON_SALE(category_id,item_on_sale_id) values (4,6);
insert into CATEGORY_ITEM_ON_SALE(category_id,item_on_sale_id) values (4,7);
insert into CATEGORY_ITEM_ON_SALE(category_id,item_on_sale_id) values (4,8);
insert into CATEGORY_ITEM_ON_SALE(category_id,item_on_sale_id) values (6,9);
insert into CATEGORY_ITEM_ON_SALE(category_id,item_on_sale_id) values (6,10);




