DELIMITER $$
    CREATE FUNCTION even(num INT)
    RETURNS TEXT(45)
    DETERMINISTIC
    BEGIN
    DECLARE evennum INT default 0;
    DECLARE result TEXT default "";

    WHILE evennum < num DO
        SET evennum = evennum + 2;
        SET result = CONCAT(result, evennum, ", ");
    END WHILE;
    return result;
END $$
DELIMITER ;

select even(10) evennumbers;