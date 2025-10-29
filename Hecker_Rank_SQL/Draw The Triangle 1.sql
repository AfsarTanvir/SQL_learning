-- Hecker Rank Easy Alternative Queries
-- https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?isFullScreen=true
-- Draw The Triangle 1

DELIMITER //

CREATE PROCEDURE Loop_Example(IN n INT)
BEGIN
    DECLARE i INT DEFAULT n;
    DECLARE j INT;

    first_loop_label: LOOP
        IF i = 0 THEN 
            LEAVE first_loop_label;
        END IF;

        SET j = 0;
        SET @line := '';  -- build one line of stars

        second_loop_label: LOOP
            IF j = i THEN
                LEAVE second_loop_label;
            END IF;

            SET @line := CONCAT(@line, '* ');
            SET j = j + 1;
        END LOOP second_loop_label;

        SELECT @line;  -- print the row

        SET i = i - 1;
    END LOOP first_loop_label;
END //

DELIMITER ;


CALL Loop_Example(20);
