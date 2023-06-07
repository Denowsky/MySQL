DELIMITER $$
    CREATE FUNCTION even(num INT)
    RETURNS TEXT(45)
    DETERMINISTIC
    BEGIN
    DECLARE evennum INT default 2;
    DECLARE result TEXT default "";

    WHILE evennum BETWEEN 0 AND num DO
        SET result = CONCAT(result, evennum, ", ");
        SET evennum = evennum + 2;
    END WHILE;
    return result;
END $$
DELIMITER ;

select even(10) evennumbers;