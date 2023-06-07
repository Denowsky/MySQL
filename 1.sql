DELIMITER $$
    CREATE FUNCTION sectotime(seconds INT)
    RETURNS TEXT(45)
    DETERMINISTIC
    BEGIN
    DECLARE result TEXT default "-";
    DECLARE DD INT default 0;
    DECLARE HH INT default 0;
    DECLARE MI INT default 0;

    WHILE seconds >= 86400 DO
    SET DD = seconds DIV 86400;
    SET seconds = seconds % 86400;
    END WHILE;

    WHILE seconds >= 3600 DO
    SET HH = seconds DIV 3600;
    SET seconds = seconds % 3600;
    END WHILE;

    WHILE seconds >= 60 DO
    SET MI = seconds DIV 60;
    SET seconds = seconds % 60;
    END WHILE;
    set result = concat(DD,' days ',HH,' hours ',MI,' minutes ',seconds, ' seconds');
    return result;
END $$
DELIMITER ;

select sectotime(123456) TimeSince from dual;