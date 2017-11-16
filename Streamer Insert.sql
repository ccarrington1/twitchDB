Set sql_safe_updates = 0;

Insert into streamer (ChannelName)
Values
("Blah"),
("Bleh"),
("Grg"),
("Ilon"),
("Nief"),
("Peli"),
("Nyme"),
("Queo"),
("Buej"),
("Mnop"),
("Zpol"),
("Ypoe"),
("Rety"),
("Buppy"),
("Rily"),
("Loppy"),
("Wuet"),
("Leoh"),
("Vino"),
("Seco");

UPDATE streamer
SET totalViews = FLOOR(RAND(10)*2000),
    totalFollowers =  FLOOR(RAND(10)*600);

Select * From streamer;
