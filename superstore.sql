use superstores;
select Customer_Name from 
cust_dimen
where Customer_Name like'___D%'
select Customer_Name from cust_dimen 
where Customer_Name like'_R%'
select sales 
from market_fact 
order by sales 
desc limit 2,1;
select Customer_Name,Province,
Customer_Segment as no_of_small_Business_owners
from cust_dimen
where Province="Ontario" and Customer_Segment="Small Business";
select Prod_id,Product_Sub_Category
from prod_dimen
where Product_Category =(select Product_Category ="Furniture" and "Techology");
use superstores;
select Region from cust_dimen;
select Prod_id,Product_Sub_Category
from prod_dimen 
where Product_Category ="furniture,Technology";
select Customer_Name as "Customer Name", 
Customer_Segment as " Customer Segment"
from cust_dimen;
use superstores;
select Region,count(*)"No_Of_Customer" from cust_dimen group by region order by No_Of_Customer;
select region,count(*)" max_no_of_customer" from cust_dimen group by region
 having max_no_of_customer >= all (select count(*)"max_no_of_customer" from cust_dimen group by region);
select c.Customer_Name,count(*)"no_fo_tables_purchased"
from market_fact m inner join cust_dimen c on m.cust_id = c.cust_id 
where c.region = 'atlantic' and m.prod_id = (select prod_id from prod_dimen where product_sub_category ='tables') group by m.cust_id,c.customer_name;
select Prod_id, count(*) as no_of_products_sold from market_fact group by prod_id order by no_of_products_sold desc;
select p.Product_Category,p.Product_Sub_Category,sum(m.Profit) "profits"
 from market_fact m inner join prod_dimen p on m.prod_id = p.prod_id group by p.Product_Category,p.Product_Sub_Category;
select Order_Date,Order_Quantity,Sales from market_fact natural join orders_dimen;
select Cust_id,Sales,Customer_Name,Region from cust_dimen join market_fact where sales between 1000 and 5000;
select p.Prod_id,p.Product_Sub_Category,m.Prod_id from market_fact m join prod_dimen p
on m.Prod_id = p.Prod_id where Product_Category = (select Product_Category from prod_dimen where Product_Category="Furniture" "technology");
select Product_Category,Profit from market_fact natural join prod_dimen order by Profit desc;