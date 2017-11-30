DELIMITER $$
DROP PROCEDURE IF EXISTS FillModeratorTable$$
CREATE PROCEDURE FillModeratorTable()
BEGIN
DECLARE i int;
SET i = 0;

WHILE i < 100 DO
Set sql_safe_updates = 0;
INSERT INTO moderator (streamerID, viewerID) VALUES (FLOOR(RAND()*20) +1, FLOOR(RAND()*20) +1);

SET i = i + 1;
END WHILE;
END$$
DELIMITER ;

