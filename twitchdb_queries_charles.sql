/*queries 1-8 */
/* #1 */ 

SELECT 
    gameName
FROM
    game
ORDER BY gameName DESC;

/* #2 */

SELECT 
    DISTINCT streamerID AS 'Self-Moderators'
FROM
    moderator m
WHERE
    streamerID = viewerID
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
    streamer
        JOIN
    viewer USING (viewerID)
ORDER BY viewerID ASC;

/* #4 */

SELECT 
    channelname, username, gamename
FROM
    streamer s
        JOIN
    viewer v
        JOIN
    game g
WHERE
    s.channelname = v.username
ORDER BY v.username ASC;

/* # 5 */

SELECT 
    channelname, totalSubscriptions AS 'Total Subs'
FROM
    streamer
GROUP BY channelname ASC
HAVING totalsubscriptions > 1;


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

SELECT 
    gamename, pcspecs
FROM
    game g
        JOIN
    streamer s
WHERE
    pcspecs > (SELECT 
            AVG(pcspecs)
        FROM
            streamer)
ORDER BY pcspecs DESC;
