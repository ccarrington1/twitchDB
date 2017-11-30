DELIMITER $$
DROP PROCEDURE IF EXISTS BirthdayReward$$
CREATE PROCEDURE BirthdayReward(IN x DATETIME, Huh int)
BEGIN
DECLARE i int;
SET i = 1;
WHILE i < 10 DO
IF (DATE_SUB(NOW(), INTERVAL i YEAR) > x) Then
UPDATE viewer SET Anniversary = Anniversary + 1 WHERE viewerID = Huh;
END IF;
SET i = i + 1;
END WHILE;
END$$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS FillModeratorTable$$
CREATE PROCEDURE FillModeratorTable()
BEGIN
DECLARE i int;
SET i = 0;

WHILE i < 100 DO
Set sql_safe_updates = 0;
INSERT INTO moderator (streamerID, viewerID) VALUES (FLOOR(RAND()*20) +1, FLOOR(RAND()*20) +1);
Call BirthdayReward((Select JoinDate FROM viewer WHERE viewerID = i));
SET i = i + 1;
END WHILE;
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS FillGameStreamingTable$$
CREATE PROCEDURE FillGameStreamingTable()
BEGIN
DECLARE i int;
SET i = 0;

WHILE i < 100 DO
Set sql_safe_updates = 0;
INSERT INTO gamestreaming (streamerID, gameID) VALUES (FLOOR(RAND()*20) +1, FLOOR(RAND()*20) +1);

SET i = i + 1;
END WHILE;
END$$
DELIMITER ;



Call BirthdayReward((SELECT JoinDate FROM viewer WHERE viewerID = 1), 1);
Call BirthdayReward((SELECT JoinDate FROM viewer WHERE viewerID = 2), 2);
Call BirthdayReward((SELECT JoinDate FROM viewer WHERE viewerID = 3), 3);
Call BirthdayReward((SELECT JoinDate FROM viewer WHERE viewerID = 4), 4);
Call BirthdayReward((SELECT JoinDate FROM viewer WHERE viewerID = 5), 5);
Call BirthdayReward((SELECT JoinDate FROM viewer WHERE viewerID = 6), 6);
Call BirthdayReward((SELECT JoinDate FROM viewer WHERE viewerID = 7), 7);
Call BirthdayReward((SELECT JoinDate FROM viewer WHERE viewerID = 8), 8);
Call BirthdayReward((SELECT JoinDate FROM viewer WHERE viewerID = 9), 9);
Call BirthdayReward((SELECT JoinDate FROM viewer WHERE viewerID = 10), 10);
Call BirthdayReward((SELECT JoinDate FROM viewer WHERE viewerID = 11), 11);
Call BirthdayReward((SELECT JoinDate FROM viewer WHERE viewerID = 12), 12);
