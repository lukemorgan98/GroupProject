# --- Sample dataset
 
# --- !Ups
 
delete from item_on_sale;
 
insert into category (id,name) values ( 1,'Jackets' );
insert into category (id,name) values ( 2,'Jumpers' );
insert into category (id,name) values ( 3,'Trousers' );
insert into category (id,name) values ( 4,'shirts' );

 
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 1,1,'north nuptse','northface, black and grey camo ',27, 100.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 2,1,'zip reflective','calvin klein',54,3.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 3,1,'Hooded Core Jacket','Lyle & Scott  durable fabric, which provides a layer of protection',30,2.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 4,1,'Core Lightweight Jacket','Emporio Armani EA7 made from durable poly which keeps you covered and comfy',87,1.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 5,1,'Half-Zip Pullover Jacket',' lightweight, water-resistant taffeta fabric',29,99.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 6,1,'Lithium Jacket','Supply & Demand, With a padded body for warmth, this jacket has contrasting sleeves and quilted stitching to the shoulders and chest ',68,50.00 );

insert into item_on_sale (id,category_id,name,description,stock,price) values ( 10,2,'Mittelegi 1/4 Zip Hoodie','The North Face, light grey colourway that brightens up your fits',58,87.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 11,2,'B-ball Overhead Hoodie','adidas Originals, made from soft cotton for an ultra-comfy wear',90, 100.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 12,2,'Core Overhead Hoodie','Champion, chilled-out grey colourway, a soft cotton fabric for a comfy wear all-day',25,49.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 13,2,'Nike Foundation Full Zip Hoodie','nike,a cosy cotton blend with ribbed trims for an optimised fit that keeps you comf, this off-duty staple comes in a low-key grey colourway',39,93.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 14,2,'Nike Academy Hoodie','nike,made from soft poly to keep you feelin comfy',40,34.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 15,2,'SikSilk Overhead Fade Hoodie','grey to white fade colourway',85,99.00 );

insert into item_on_sale (id,category_id,name,description,stock,price) values ( 19,3,'Rip Washed Skinny Jeans','Made from a stretchy cotton blend for a comfy fit and feel, these jeans have a skinny cut in a washed black colourway',77,50.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 20,3,'Drake Twill Chino','Farah,  a navy colourway, they are built from stretchy cotton twill, which gives you a slim fit.',98,47.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 21,3,'Essential Slim Leg Jeans','Supply & Demand, Built from stretch cotton in a black colourway ',92, 66.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 22,3,'Westend Pants','Columbia, Made from durable poly fabric in a blue grey colourway',93,100.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 23,3,'Skinny Denim Jeans','SikSilk,  Made from stretchy cotton denim for a skinny fit',100,61.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 24,3,'Lowrise Distress Jeans','SickSilk,In a blue colourway these jeans have a skinny fit and feature a button fly with an elongated belt loop',26,85.00 );

insert into item_on_sale (id,category_id,name,description,stock,price) values ( 28,4,'Lyle & Scott Long Sleeve Oxford Shirt','made from a comfy cotton fabric',37,39.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 29,4,'Farah Brewer Long Sleeve Shirt','Made from 100% cotton for a premium fit',31,40.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 30,4,'Lyle & Scott Long Sleeve Oxford Shirt','In a white colourway, this shirt is made from cotton for an ultra-comfy',91,29.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 31,4,'Nanny State Long Sleeve Hinkly Shirt','made from an elastane blend, meaning the material is stretchy and allows for a relaxed and easy movement',75,39.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 32,4,'Lyle & Scott Oxford Long Sleeve Shirt','comes in a burgundy colourway',68,31.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 33,4,'Farah Steen Slim Long Sleeve Shirt',' made with a comfy cotton fabric with a full button up fastening for a secure fit',88,17.00 );