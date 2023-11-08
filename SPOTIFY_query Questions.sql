/*1. Basic Data Retrieval:
a.Retrieve the names of all songs released in a specific year.
b.Find the songs with the highest and lowest danceability percentages.
c.List the songs with the most streams on Spotify.*/
# CREATE SCHEMA spotify; #then Import Wizard dataset
 
/*SELECT track_name,released_year FROM spotify.`spotify-2023`
WHERE released_year = 2023*/

/*SELECT track_name FROM `spotify-2023`
WHERE `danceability_%` = (SELECT MIN(`danceability_%`) FROM `spotify-2023`)
UNION ALL
SELECT track_name FROM `spotify-2023`
WHERE `danceability_%` = (SELECT MAX(`danceability_%`) FROM `spotify-2023`);*/
#OR
/*SELECT `artist(s)_name`,track_name FROM `spotify-2023`
ORDER BY `danceability_%` ASC;*/

/*SELECT track_name FROM `spotify-2023`
ORDER BY streams DESC;*/


/*2. Data Filtering and Sorting:
a.Show songs with a certain BPM range.
b.Find songs with high energy levels.
c.Identify songs released in a particular month.*/

/*SELECT track_name,bpm FROM `spotify-2023` 
WHERE BPM >= 100 AND BPM < 111;*/

/*SELECT track_name,`artist(s)_name` FROM `spotify-2023`
ORDER BY `energy_%` DESC
LIMIT 10;*/

/*SELECT `artist(s)_name`,track_name FROM `spotify-2023`
WHERE released_month = 5
LIMIT 10;*/


/*3. Aggregation:
a.Calculate the average BPM, danceability, and valence percentages.
b.Determine the most popular key and mode in songs.
c.Find the song with the highest instrumentalness percentage.*/

/*SELECT AVG(bpm) AS bpm_percent
FROM `spotify-2023`;
SELECT AVG(`danceability_%`) AS danceability_percent
FROM `spotify-2023`;
SELECT AVG(`valence_%`) AS valence_percent
FROM `spotify-2023`;*/
###OR
/*SELECT 
(SELECT AVG(bpm) FROM `spotify-2023`) AS bpm_percent,
(SELECT AVG(`danceability_%`) FROM `spotify-2023`) AS danceability_percent,
(SELECT AVG(`valence_%`) FROM `spotify-2023`) AS valence_percent;*/

/*SELECT 
	`key` AS popular_key,
    `mode` AS popular_mode
FROM `spotify-2023`
GROUP BY `key`,`mode`
ORDER BY COUNT(*) DESC
LIMIT 5;*/

/*SELECT track_name FROM `spotify-2023`
ORDER BY `instrumentalness_%` DESC
LIMIT 1;*/


/*4. Data Modification:
a.Update the artist name for specific songs.
b.Add a new column that calculates the total positivity based on valence and energy percentages.
c.Delete songs with low danceability percentages.*/

/*UPDATE `spotify-2023` 
SET `artist(s)_name` = 'DRACULA'   # Most famous vampire blahhh!
WHERE track_name = 'vampire';*/


/*ALTER TABLE `spotify-2023` 
ADD COLUMN total_positivity DECIMAL (10,2);

UPDATE `spotify-2023` 
SET total_positivity = `valence_%` + `energy_%`;

SELECT total_positivity FROM spotify.`spotify-2023`;*/

/*START TRANSACTION;
DELETE FROM `spotify-2023`
WHERE `danceability_%` < 80;*/
# If client is satisfied than you can, COMMIT
# If not, ROLLBACK
/*ROLLBACK;*/


/*5. Data Modification:
a.Join the song dataset with an artist dataset to 
find which artists have the most popular songs.*/

/*SELECT 
`artist(s)_name` AS artist_name,
SUM(streams) AS total_streams
FROM `spotify-2023`
GROUP BY `artist(s)_name`
ORDER BY total_streams DESC
LIMIT 10;*/


SELECT * FROM spotify.`spotify-2023`;

