CREATE TABLE Channel (
	ChannelID INT PRIMARY KEY,
	Name VARCHAR(150) NOT NULL,
	SubscriberCount INT DEFAULT(0),
	CreationDate DATETIME NOT NULL
);

SELECT *
FROM Channel;

CREATE Table Video (
	VideoID INT PRIMARY KEY,
	Name VARCHAR(150) NOT NULL,
	VideoViews INT DEFAULT(0),
	Likes INT DEFAULT(0),
	Dislikes INT DEFAULT(0),
	Duration INT DEFAULT(0),
	ChannelID INT FOREIGN KEY REFERENCES Channel(ChannelID)
);

SELECT *
FROM Video;

INSERT INTO Channel (ChannelID, Name, SubscriberCount, CreationDate) VALUES
	(1, 'Tech Insights', 50000, '2020-01-10'),
	(2, 'Cooking With Passion', 200000, '2018-03-15'),
	(3, 'Daily Vlogs', 75000, '2019-05-20'),
	(4, 'Fitness World', 120000, '2021-02-25'),
	(5, 'Music Mania', 350000, '2017-07-11'),
	(6, 'Gaming Legends', 450000, '2020-08-30'),
	(7, 'Movie Reviews', 90000, '2019-10-15'),
	(8, 'Travel Adventures', 180000, '2016-12-05'),
	(9, 'Science Explained', 110000, '2018-06-01'),
	(10, 'Home Improvement', 95000, '2020-11-20'),
	(11, 'Artistic Creations', 60000, '2021-01-07'),
	(12, 'History Buffs', 80000, '2019-09-25'),
	(13, 'Car Enthusiasts', 150000, '2017-05-30'),
	(14, 'Fashion Forward', 250000, '2016-11-18'),
	(15, 'Tech Tutorials', 300000, '2018-08-12'),
	(16, 'Educational Hub', 120000, '2020-05-27'),
	(17, 'Health and Wellness', 95000, '2017-03-22'),
	(18, 'Sports Highlights', 220000, '2019-12-10'),
	(19, 'Book Lovers', 50000, '2018-07-16'),
	(20, 'DIY Crafts', 40000, '2021-09-03');

INSERT INTO Video (VideoID, Name, VideoViews, Likes, Dislikes, Duration, ChannelID) VALUES
	(1, 'Tech Trends 2024', 100000, 5000, 200, 600, 1),
	(2, 'Top 5 Programming Languages', 150000, 7000, 300, 450, 1),
	(3, 'AI in Everyday Life', 80000, 4000, 150, 780, 1),
	(4, 'Delicious Pasta Recipes', 250000, 15000, 400, 900, 2),
	(5, 'Baking Tips for Beginners', 200000, 10000, 350, 1200, 2),
	(6, 'Grilling Perfection', 170000, 8500, 300, 850, 2),
	(7, 'Day in My Life Vlog', 50000, 3000, 100, 1800, 3),
	(8, 'Traveling to Paris', 60000, 3500, 120, 2400, 3),
	(9, 'Weekend with Friends', 45000, 2500, 90, 1700, 3),
	(10, 'Full Body Workout Routine', 125000, 6000, 200, 1200, 4),
	(11, 'Cardio for Beginners', 100000, 5500, 180, 1300, 4),
	(12, 'Home Workout Equipment Guide', 95000, 5000, 150, 1100, 4),
	(13, 'Top 10 Music Albums', 300000, 20000, 700, 800, 5),
	(14, 'Guitar Solo Lessons', 250000, 18000, 600, 900, 5),
	(15, 'Music History 101', 230000, 17000, 550, 950, 5),
	(16, 'Best Games of 2024', 400000, 25000, 900, 1200, 6),
	(17, 'Gaming PC Setup Guide', 380000, 24000, 850, 1500, 6),
	(18, 'Retro Games Revisited', 360000, 22000, 800, 1600, 6),
	(19, 'Movie Review: Blockbuster Hit', 95000, 4500, 200, 1400, 7),
	(20, 'Top 5 Sci-Fi Movies', 100000, 5000, 220, 1600, 7),
	(21, 'Horror Movie Classics', 85000, 4000, 180, 1300, 7),
	(22, 'Top Travel Destinations', 210000, 11000, 400, 2200, 8),
	(23, 'Budget Travel Tips', 195000, 10000, 350, 1800, 8),
	(24, 'Luxury Travel Guide', 250000, 13000, 500, 2500, 8),
	(25, 'Quantum Physics Explained', 120000, 6000, 250, 900, 9),
	(26, 'The Science of Climate Change', 130000, 6500, 300, 1100, 9),
	(27, 'Space Exploration Advances', 115000, 5800, 270, 1300, 9),
	(28, 'Home Renovation Tips', 90000, 4500, 150, 1400, 10),
	(29, 'DIY Painting Projects', 85000, 4200, 130, 1600, 10),
	(30, 'Organizing Small Spaces', 95000, 4800, 170, 1200, 10),
	(31, 'Abstract Art for Beginners', 60000, 3200, 100, 800, 11),
	(32, 'Watercolor Techniques', 70000, 3500, 120, 1000, 11),
	(33, 'Sketching Fundamentals', 55000, 3000, 90, 900, 11),
	(34, 'Ancient Civilizations', 95000, 5000, 160, 1100, 12),
	(35, 'World War II History', 85000, 4800, 140, 1200, 12),
	(36, 'Famous Historical Figures', 100000, 5200, 180, 1000, 12),
	(37, 'Car Modifications', 150000, 7500, 250, 1300, 13),
	(38, 'Luxury Car Reviews', 140000, 7200, 240, 1100, 13),
	(39, 'Classic Cars Revisited', 130000, 7000, 230, 1500, 13),
	(40, 'Spring Fashion Trends', 250000, 13000, 500, 1400, 14),
	(41, 'Wardrobe Essentials', 230000, 12000, 450, 1500, 14),
	(42, 'How to Accessorize', 240000, 12500, 470, 1300, 14),
	(43, 'Best Tech Gadgets', 280000, 15000, 600, 1400, 15),
	(44, 'How to Build a PC', 320000, 18000, 700, 1500, 15),
	(45, 'Tech Trends 2024', 290000, 16000, 650, 1300, 15),
	(46, 'Online Learning Tips', 120000, 6000, 220, 900, 16),
	(47, 'Time Management Skills', 110000, 5500, 200, 800, 16),
	(48, 'Effective Study Techniques', 115000, 5800, 210, 1000, 16),
	(49, 'Healthy Meal Plans', 100000, 5000, 200, 1100, 17),
	(50, 'Mental Health Awareness', 90000, 4500, 180, 1200, 17),
	(51, 'Fitness Routines for Busy People', 105000, 5200, 190, 900, 17),
	(52, 'Top Sports Moments', 250000, 13000, 400, 1200, 18),
	(53, 'Football World Cup Recap', 220000, 12000, 380, 1500, 18),
	(54, 'Athlete Biographies', 240000, 12500, 420, 1400, 18),
	(55, 'Top 10 Books to Read', 80000, 4000, 140, 1000, 19),
	(56, 'Book Review: Sci-Fi Classics', 85000, 4200, 150, 1200, 19),
	(57, 'Best Fantasy Novels', 90000, 4500, 160, 1300, 19),
	(58, 'DIY Home Decor Projects', 40000, 2000, 80, 900, 20),
	(59, 'Creative Craft Ideas', 45000, 2300, 90, 800, 20),
	(60, 'Upcycling Projects', 50000, 2500, 100, 1000, 20);

SELECT * INTO BackupTable
FROM Video;

SELECT *
FROM BackupTable;

UPDATE Video
SET Dislikes = 0;

SELECT *
FROM Video;

UPDATE Video
SET Likes = 999999999
WHERE VideoID = 1;

DELETE 
FROM Video
WHERE Name = 'Top 5 Programming Languages';

ALTER TABLE Channel
ADD Active BIT;

ALTER TABLE Channel
ALTER COLUMN Name VARCHAR(200) NOT NULL;

-- EXEC SP_RENAME 'tableName.actualColumnName', 'newColumnName', 'COLUMN' -- To rename the column

EXEC SP_RENAME 'Video.VideoViews', 'Views', 'COLUMN'

SELECT *
FROM Video;

-- EXEC SP_RENAME 'tableName', 'newTableName' -- To rename the table

EXEC SP_RENAME 'Channel', 'YTChannel'

SELECT *
FROM Channel; -- Error

SELECT *
FROM YTChannel;

CREATE TABLE FakeChannel (
	ChannelID INT PRIMARY KEY,
	Name VARCHAR(150) NOT NULL,
	SubscriberCount INT DEFAULT(0),
	CreationDate DATETIME NOT NULL
);

SELECT *
FROM FakeChannel;

DROP TABLE FakeChannel;

CREATE TABLE FakeChannel2 (
	ChannelID INT PRIMARY KEY,
	Name VARCHAR(150) NOT NULL,
	SubscriberCount INT DEFAULT(0),
	CreationDate DATETIME NOT NULL
);

INSERT INTO FakeChannel2 (ChannelID, Name, SubscriberCount, CreationDate) VALUES
	(1, 'Tech Insights', 50000, '2020-01-10'),
	(2, 'Cooking With Passion', 200000, '2018-03-15'),
	(3, 'Daily Vlogs', 75000, '2019-05-20');

SELECT *
FROM FakeChannel2;

TRUNCATE TABLE FakeChannel2;