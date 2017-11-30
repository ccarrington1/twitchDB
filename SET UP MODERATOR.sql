
DELIMITER $$
DROP PROCEDURE IF EXISTS test$$
CREATE PROCEDURE test()
BEGIN
DECLARE i int;
SET i = 0;

WHILE i < 200 DO
Set sql_safe_updates = 0;
INSERT INTO moderator (streamerID, viewerID) VALUES (FLOOR(RAND()*20), FLOOR(RAND()*21));

SET i = i + 1;
END WHILE;
END$$
DELIMITER ;

CALL test();