/*queries 1-8 */
/* #1 */ 

SELECT 
    gameName AS 'Games Streamed'
FROM
    game
ORDER BY gameName DESC;

/* #2 */

SELECT 
    DISTINCT streamerID AS 'Self-Moderators'
FROM
    moderator m
    Inner JOin viewer v
WHERE
    m.streamerID =  v.viewerID
ORDER BY streamerID ASC;

/* #3 */

SELECT 
    viewerID,
    UserName,
    ChannelName,
    DATE_FORMAT(CAST(joindate AS DATE), '%M/%d/%Y') AS 'Date Joined',
    FORMAT(totalviews, 0) AS 'Total Views',
    FORMAT(totalfollowers, 0) AS 'Total Followers',
    subscriptionButton AS 'Can Followers Subscribe?',
    FORMAT(totalSubscriptions, 0) AS 'Total Subscriptions',
    Mature,
    CONCAT('$', FORMAT(donations, 2)) AS 'Total Donations',
    Doners,
    Moderator
FROM
    streamer s
        LEft JOIN
    viewer v USING (viewerID)
ORDER BY viewerID ASC;

/* #4 */

SELECT streamer.streamerID, channelName,
		GROUP_CONCAT(DISTINCT game.gameID) AS 'Games Streamed',
        GROUP_CONCAT(DISTINCT game.gameName) AS 'Games'
FROM streamer
JOIN gamestreaming ON streamer.streamerID = gamestreaming.streamerID
JOIN game ON game.gameID = gamestreaming.gameID
WHERE streamer.streamerID < 6
Group BY streamerID;

/* # 5 */

SELECT 
    channelname, SUM(totalSubscriptions) AS 'Total Subs' 
FROM
    streamer
GROUP BY channelname ASC WITH ROLLUP
HAVING SUM(totalSubscriptions) > 1;


/* #6 */

SELECT 
    username AS 'Username',
    CONCAT('$', Format(donations, 2)) AS 'Total Donations',
    DATE_FORMAT(CAST(joindate AS DATE), '%M/%d/%Y') AS 'Date Joined',
    CONCAT(Format(totalviews, 0), ' / ', Format(totalfollowers, 0)) AS 'views / followers'
FROM
    streamer JOIN viewer USING (viewerID)
ORDER BY username ASC;

/* #7 */

SELECT 
    channelname,
    ROUND(totalviews / totalfollowers, 2) AS Avg_Follows_Per_Views
FROM
    streamer
ORDER BY channelname ASC;

/* #8 */

SELECT game.gameName,
       ROUND(AVG(streamer.Processor)) AS 'AVG Processors Used'
FROM game
JOIN gamestreaming ON game.gameID = gamestreaming.gameID
JOIN streamer ON streamer.streamerID = gamestreaming.streamerID

where (select streamer.processor >= 4)
GROUP BY gameName;
