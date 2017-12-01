# twitchDB
MySQL Final Project

This is our Twitch.tv database final project.  

**************** 
Created by:
John Moore
Charles Carrington
Seth Brown
Heaven Schatz
**************** 

Our database is designed to show data from twitch streamers, viewers, and moderators, showing the games and genres they play.  
It also shows in depth analyasis for donations, pc specs (processors), join dates, subscriptions, and other in depth streamer analysis. 


****************************************************************
Follow these steps to get your Twitch database up and running:
****************************************************************

1. Open file location.
2. Run Twitch Setup. (builds structures, executes inserts/updates/triggers, runs procedures)
3. Run Twitch View. (optional)
4. Run Twitch Queries. (optional)

To elaborate on some of our unique procedures, data generation, and triggers, here are some examples we used:

- We have a procedure that will show how many years the user has been a part of Twitch.
- We have a procedure that will generate up to 100 entries of data for each table. 
