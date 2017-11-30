SELECT streamer.streamerID,
	   GROUP_CONCAT(viewer.viewerID)
FROM streamer
JOIN moderator ON streamer.streamerID = moderator.streamerID
JOIN viewer ON viewer.viewerID = moderator.viewerID
GROUP BY streamer.streamerID;

