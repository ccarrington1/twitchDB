SELECT streamer.streamerID,
	   GROUP_CONCAT(DISTINCT viewer.viewerID) AS 'Moderators'
FROM streamer
JOIN moderator ON streamer.streamerID = moderator.streamerID
JOIN viewer ON viewer.viewerID = moderator.viewerID
GROUP BY streamer.streamerID;

SELECT viewer.viewerID,
	   GROUP_CONCAT(DISTINCT streamer.streamerID) AS 'Streamers Moderated'
FROM viewer
JOIN moderator ON viewer.viewerID = moderator.viewerID
JOIN streamer ON streamer.streamerID = moderator.streamerID
GROUP BY viewer.viewerID;