/*queries 1-8 */

/* #1 */
select gameName from game
order by gameName desc;

/* #2 */

select streamerID from moderator m
inner join viewer v where m.streamerID = v.viewerID
order by streamerID asc;

/* #3 */

select * from streamer s
left join viewer v on viewerID
order by viewerID asc;

/* #4 */

select channelname, username, gamename
from streamer s join viewer v join game g where s.channelname = v.username
order by v.username asc;

/* # 5 */

select channelname, count(totalSubscriptions) as 'Total Subs'
from streamer
group by channelname asc
having count(totalsubscriptions) > 1;

/* #6 */

select 
username,
round(avg(donations)) as 'Average Donation',
sum(donations) as 'Total Donations', 
date_format(cast(joindate as date), '%M/%d/%y') as 'MM/dd/yy',
concat(totalviews, ' ', totalfollowers) as 'views/followers'

from streamer s
join viewer v

order by username asc;

/* #7 */





/* #8 */
