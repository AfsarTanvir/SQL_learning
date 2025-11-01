-- Hecker Rank Medium Advanced
-- https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=true
-- Print Prime Numbers

DELIMITER //

CREATE PROCEDURE prime_number(IN n INT)
BEGIN 
    DECLARE i INT DEFAULT 3;
    DECLARE j INT;
    DECLARE isPrime INT;
    SET @line := '2';
    
    first_loop: LOOP
        IF i>n THEN
            LEAVE first_loop;
        END IF;
        
        SET j = 2;
        SET isPrime = 1;
        second_loop: LOOP
            IF j*j>i THEN
                LEAVE second_loop;
            END IF;
            
            IF i%j=0 THEN
                SET isPrime = 0;
                LEAVE second_loop;
            END IF;
            SET j = j + 1;
        END LOOP second_loop;
        IF isPrime = 1 THEN
            SET @line := CONCAT(@line, '&', i);
        END IF;
        SET i = i+1;
    END LOOP first_loop;
    SELECT @line;
END //

DELIMITER ;

CALL prime_number(1000);