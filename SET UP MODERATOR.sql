
DELIMITER $$
DROP PROCEDURE IF EXISTS FillModeratorTable$$
CREATE PROCEDURE FillModeratorTable()
BEGIN
DECLARE i int;
SET i = 0;

WHILE i < 100 DO
Set sql_safe_updates = 0;
INSERT INTO moderator (streamerID, viewerID) VALUES (FLOOR(RAND()*21), FLOOR(RAND()*21));

SET i = i + 1;
END WHILE;
END$$
DELIMITER ;

CALL FillModeratorTable();