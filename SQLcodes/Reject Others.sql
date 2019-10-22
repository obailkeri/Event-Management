
delimiter //
create procedure reject_others1(in eid int)
begin
    declare finished,e_id,temp int default 0;
    declare send_msg cursor for select T.event_id from (select el.event_id,room_id,start_date,end_date,time_slot from event_ledger as el join slots_and_details as sd where el.event_id = sd.event_id and time_slot = 1) as T,(select el.event_id,room_id,start_date,end_date,time_slot from event_ledger as el join slots_and_details as sd where el.event_id = sd.event_id and time_slot = 1) as F where T.event_id != F.event_id and T.start_date = F.start_date and T.event_id != eid and T.start_date = (select start_date from event_ledger where event_id = eid);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    open send_msg;
    msg : loop
        fetch send_msg into e_id;
        IF finished = 1 THEN 
            LEAVE msg;
        end if;
        select @temp :=  ifnull((select max(communication_number) from resource_communication where event_id = e_id) + 1,1);
        insert into resource_communication values(e_id,'Please Select Another set of rooms for your event',@temp,1);
    END LOOP msg;
    close send_msg;
end//

delimiter ;


delimiter //
create procedure reject_others2(in eid int)
begin
    declare finished,e_id,temp int default 0;
    declare send_msg cursor for select T.event_id from (select el.event_id,room_id,start_date,end_date,time_slot from event_ledger as el join slots_and_details as sd where el.event_id = sd.event_id and time_slot = 2) as T,(select el.event_id,room_id,start_date,end_date,time_slot from event_ledger as el join slots_and_details as sd where el.event_id = sd.event_id and time_slot = 2) as F where T.event_id != F.event_id and T.start_date = F.start_date and T.event_id != eid and T.start_date = (select start_date from event_ledger where event_id = eid);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    open send_msg;
    msg : loop
        fetch send_msg into e_id;
        IF finished = 1 THEN 
            LEAVE msg;
        end if;
        select @temp :=  ifnull((select max(communication_number) from resource_communication where event_id = e_id) + 1,1);
        insert into resource_communication values(e_id,'Please Select Another set of rooms for your event',@temp,1);
    END LOOP msg;
    close send_msg;
end//

delimiter ;


delimiter //
create procedure reject_others3(in eid int)
begin
    declare finished,e_id,temp int default 0;
    declare send_msg cursor for select T.event_id from (select el.event_id,room_id,start_date,end_date,time_slot from event_ledger as el join slots_and_details as sd where el.event_id = sd.event_id and time_slot = 3) as T,(select el.event_id,room_id,start_date,end_date,time_slot from event_ledger as el join slots_and_details as sd where el.event_id = sd.event_id and time_slot = 3) as F where T.event_id != F.event_id and T.start_date = F.start_date and T.event_id != eid and T.start_date = (select start_date from event_ledger where event_id = eid);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    open send_msg;
    msg : loop
        fetch send_msg into e_id;
        IF finished = 1 THEN 
            LEAVE msg;
        end if;
        select @temp :=  ifnull((select max(communication_number) from resource_communication where event_id = e_id) + 1,1);
        insert into resource_communication values(e_id,'Please Select Another set of rooms for your event',@temp,1);
    END LOOP msg;
    close send_msg;
end//

delimiter ;