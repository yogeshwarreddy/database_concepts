use restaurant;

select log.id,max(log.count) as visits from (select id, count(*) as count from `order` group by customer_id) as log;

select * from customer join (select log.id,max(log.count) as visits from (select id, count(*) as count from `order` group by customer_id) as log) on log.id = customer.id;


select customer.*,log.visits from customer join (select log.id,max(log.count) as visits from (select id, count(*) as count from `order` group by customer_id) as log)as log on log.id = customer.id;

select customer.*, max(log.visits) as visits from customer join (select id, count(*) as visits from `order` group by customer_id) as log on log.id = customer.id;


Create view  vw_customerSnapshot as
	select customer.*, max(log.visits) as visits from 
		customer 
	join 
		(select id, count(*) as visits from `order` group by customer_id) as log 
	on log.id = customer.id;


select * from vw_customerSnapshot;


create view vw_OrderSnapshot as 
	select item.*, max(item_ledger.counts) as sold_quantity from 
		item 
	join 
		(select item_id,sum(quantity) as counts from order_item group by item_id) as item_ledger 
	on item_ledger.item_id = item.id;


select * from order_item group by item_id;

select * from order_item;

select item_id,sum(quantity) from order_item group by item_id;


select item.*, max(item_ledger.counts) as sold_quantity from item join (select item_id,sum(quantity) as counts from order_item group by item_id) as item_ledger on item_ledger.item_id = item.id;

use restaurant;
SELECT SEC_TO_TIME(TIMESTAMPDIFF(SECOND,`order_item`.`created_on`,CURRENT_TIMESTAMP()));

drop function fn_GetOrderTimeElapsed;
delimiter $$
create function fn_GetOrderTimeElapsed(customerid int)
returns TIME
begin
	return SEC_TO_TIME(TIMESTAMPDIFF(SECOND, (select created_on from `order` where customer_id = customerid order by created_on desc limit 1),CURRENT_TIMESTAMP()));
end$$
delimiter ;

select fn_GetOrderTimeElapsed(5);

delimiter $$
create procedure sp_GetOrder (IN customerid int)
begin
	select item.*,order_item.quantity from item join order_item on item.id = order_item.item_id where order_id = (select `order`.id from `order` where `order`.customer_id = customerid order by created_on desc limit 1);
end$$
delimiter ;


select item.*,order_item.quantity from item join order_item on item.id = order_item.item_id where order_id = (select `order`.id from `order` where `order`.customer_id = 1 order by created_on desc limit 1);

call sp_GetOrder(1);


delimiter $$
create procedure sp_GenerateBill(IN OrderID int, OUT Bill_AMT double)
begin
	select amount into Bill_AMT from `order` where id = OrderID;
end$$
delimiter ;


set @amount = 0;
call sp_GenerateBill(1,@amount);
select @amount as bill;