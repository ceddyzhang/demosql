delimiter //

drop procedure if exists get_records_by_state;

##From a list of clients, take out the ones from a certain state. If nothing is provided, display a message
create procedure get_records_by_state (in state char(2))
begin
	#Error handling mechanism when input is null
    if state is null or state = '' then
		signal sqlstate '22004'
				set message_text = 'invalid input';
	else
		(select * 
		from sql_invoicing.clients as c
		where c.state = state);
	end if;
end//

delimiter ;