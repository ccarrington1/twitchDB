DELIMITER $$
DROP PROCEDURE IF EXISTS BirthdayReward$$
CREATE PROCEDURE BirthdayReward(IN x DATETIME)
BEGIN
IF (DATE_SUB(NOW(), INTERVAL 1 YEAR) > x) Then
Select * FROM viewer;
END IF;
END$$
DELIMITER ;

Call BirthdayReward(viewer.JoinDate);