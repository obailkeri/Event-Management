DELIMITER //

CREATE PROCEDURE getUserEventStatus(
    IN uname VARCHAR(30)
)
BEGIN
    DECLARE count,pos,flag,finished INT DEFAULT 0;
    DECLARE name,user VARCHAR(30);
    DECLARE std,etd DATE;
    DECLARE event_list CURSOR for SELECT @sDate := @sDate +1 Start_Date,event_name,username,start_date,end_date FROM event_ledger,(SELECT @sDate := 0) m ORDER BY start_date ASC;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    OPEN event_list;
    DROP TABLE IF EXISTS returnqs;
    CREATE TABLE returnqs(position INT,e_name VARCHAR(20),start_date DATE,end_date DATE);
    SET flag = 0;
    addFirstFive: LOOP
        FETCH event_list INTO pos,name,user,std,etd;
        INSERT INTO returnqs VALUES(pos,name,std,etd);
        IF finished = 1 THEN
            LEAVE addFirstFive;
        END IF;
        IF user = uname THEN
            SET flag = 1;
        END IF;
        IF pos = 5 THEN
            LEAVE addFirstFive;
        END IF;
    END LOOP addFirstFive;  
    IF flag = 0 THEN
        findfirstocc: LOOP
            FETCH event_list INTO pos,name,user,std,etd;
            IF finished = 1 THEN
                LEAVE findfirstocc;
            END IF;
            IF user = uname THEN
                INSERT INTO returnqs VALUES(pos,name,std,etd);
            END IF;
        END LOOP findfirstocc;
    END IF; 
    CLOSE event_list;
END //

DELIMITER ;