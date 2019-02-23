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
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 7,1,'Colour Block Lightweight Jacket','Columbia , durable poly fabric with a windproof finish and fitted trims to keep you covered',98,300.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 8,1,'Linwood 1/4 Zip Jacket','Farah ,shiny blue colourway',61,75.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 9,1,'Windrunner Jacket','Nike, black and red colour block design',72,50.00 );

insert into item_on_sale (id,category_id,name,description,stock,price) values ( 10,6,'Mittelegi 1/4 Zip Hoodie','The North Face, light grey colourway that brightens up your fits',58,87.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 11,1,'B-ball Overhead Hoodie','adidas Originals, made from soft cotton for an ultra-comfy wear',90, 100.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 12,2,'Core Overhead Hoodie','Champion, chilled-out grey colourway, a soft cotton fabric for a comfy wear all-day',25,49.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 13,3,'Nike Foundation Full Zip Hoodie','nike,a cosy cotton blend with ribbed trims for an optimised fit that keeps you comf, this off-duty staple comes in a low-key grey colourway',39,93.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 14,4,'Nike Academy Hoodie','nike,made from soft poly to keep you feelin comfy',40,34.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 15,5,'SikSilk Overhead Fade Hoodie','grey to white fade colourway',85,99.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 16,4,'Supply & Demand Source','Supply and demand, made from soft polyester for a laid back and comfy fit from head to toe',28,50.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 17,1,'Colour Block Overhead Hoodie','11 Degrees, Made from a soft cotton fabric for a comfy wear every time you pull it on, its pull string hood and ribbed trims keep you covered',58,96.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 18,4,'Tape Overhead Hoodie','adidas Originals,  Made from a soft cotton blend with a cosy fleece inner, this hoodie has an overhead style with a central kangaroo pocket and an adjustable hood.',84,75.00 );

insert into item_on_sale (id,category_id,name,description,stock,price) values ( 19,6,'Rowing machine','Great for keeping fit',77,50.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 20,6,'Junior tennis raquet','Never used',98,47.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 21,1,'Television','Sony 42" LCD',92, 66.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 22,2,'Book','Mysteries of the Universe',93,100.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 23,3,'Fluffy Socks','Warm extra long socks (new)',100,61.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 24,4,'Tumbler Glass','Reject tumbler glasses (new)',26,85.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 25,5,'Piano','Grand, in need of tuning',48,74.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 26,4,'Chair','Comfortable armchair in good condition',89,49.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 27,1,'Washing Machine','1600rpm spin, A+++ rated, 10KG',38,31.00 );

insert into item_on_sale (id,category_id,name,description,stock,price) values ( 28,4,'Water jug','Antique cristal, 2l',37,39.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 29,6,'Rowing machine','Great for keeping fit',31,40.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 30,6,'Junior tennis raquet','Never used',91,29.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 31,6,'Junior tennis raquet','Never used',75,39.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 32,6,'Junior tennis raquet','Never used',68,31.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 33,6,'Junior tennis raquet','Never used',88,17.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 34,6,'Junior tennis raquet','Never used',79,32.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 35,6,'Junior tennis raquet','Never used',64,15.00 );
insert into item_on_sale (id,category_id,name,description,stock,price) values ( 36,6,'Junior tennis raquet','Never used',87,30.00 );