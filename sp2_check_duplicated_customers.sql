delimiter //

drop procedure if exists checkduplicates;

#insert some duplicate rows first, then check which customers have duplicated records (first name AND last name are the same)
create procedure checkduplicates()
begin
	#Step 1, Inserting duplicated records
    insert into sql_store.customers (first_name, last_name, address, city, state)
	values ('Babara', 'MacCaffrey', 'some street', 'some city', 'CA'),
			('Babara', 'MacCaffrey', 'some street', 'some city', 'CA');
	#Step 2, When there are duplicates, actual_id and first_appear_id will be different
    select t1.customer_id as actual_id, t2.customer_id as first_appear_id, t1.first_name, t2.last_name, t2.frequency
	from sql_store.customers as t1
	inner join (select customer_id, first_name, last_name, count(*) as frequency
				from customers
				group by first_name, last_name) as t2
			on t1.first_name = t2.first_name and t1.last_name = t2.last_name
	having actual_id >= first_appear_id;
end//

delimiter ;
