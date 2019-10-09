DELIMITER //
create procedure shift_to_history(in eid int)
   begin
		insert into event_ledger_history(event_id,event_name,description,username,status_level,prev_status_level,start_date,end_date) select * from event_ledger where event_id = eid;
		insert into misc_ledger_history(event_id,request_number,req_start,req_description,request_category,req_end) select * from misc_ledger where event_id = eid;
		insert into slots_and_details_history (event_id,room_id,status_level,prev_status_level,purpose,purpose_explained,time_slot_start,time_slot_end) select * from slots_and_details where event_id = eid;
		insert into resource_communication_history(event_id,message,communication_number,communication_flag) select * from resource_communication where event_id = eid;
		insert into event_communication_history(event_id,message,communication_number,communication_flag) select * from event_communication where event_id = eid;
		insert into security_acknowledgement_history(event_id,student_id,in_time,out_time)select * from security_acknowledgement where event_id = eid;
        
		delete from resource_communication where event_id = eid;
		delete from event_communication where event_id = eid;
		delete from slots_and_details where event_id = eid;
		delete from misc_ledger where event_id = eid;
        delete from security_acknowledgement where event_id = eid;
		delete from event_ledger where event_id = eid;
    end//
    
DELIMITER ;