/*queries 1-8 */
/* #1 */ 

SELECT 
    gameName
FROM
    game
ORDER BY gameName DESC;

/* #2 */

SELECT 
    streamerID
FROM
    moderator m
        INNER JOIN
    viewer v
WHERE
    m.streamerID = v.viewerID
ORDER BY streamerID ASC;

/* #3 */

SELECT 
    *
FROM
    streamer s
        LEFT JOIN
    viewer v ON viewerID
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
    channelname, COUNT(totalSubscriptions) AS 'Total Subs'
FROM
    streamer
GROUP BY channelname ASC
HAVING COUNT(totalsubscriptions) > 1;

/* #6 */

SELECT 
    username AS 'Username',
    CONCAT('$', Format(ROUND(AVG(donations)),2)) AS 'Average Donation',
    CONCAT('$', Format(SUM(donations), 2)) AS 'Total Donations',
    DATE_FORMAT(CAST(joindate AS DATE), '%M/%d/%Y') AS 'Date Joined',
    CONCAT(Format(totalviews, 0), ' / ', Format(totalfollowers, 0)) AS 'views / followers'
FROM
    streamer s
        JOIN
    viewer v 
ORDER BY username ASC;

/* #7 */

SELECT 
    channelname,
    (totalviews / totalfollowers) AS Avg_Follows_Per_Views
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
