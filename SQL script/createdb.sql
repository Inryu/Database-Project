/*create Artist, album, song table*/
CREATE TABLE ARTIST (
	artist_sn INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	debut_date DATE NOT NULL,
 	type VARCHAR(10) NOT NULL,
	gender VARCHAR(10) NOT NULL
);

CREATE TABLE ALBUM (
	album_sn INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	release_date DATE NOT NULL,
 	artist_sn INT NOT NULL,
  	FOREIGN KEY (artist_sn)
		REFERENCES ARTIST(artist_sn)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE SONG (
	song_sn INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(20) NOT NULL,
	genre VARCHAR(20) NOT NULL,
	artist_sn INT NOT NULL,
	album_sn INT NOT NULL,
  	FOREIGN KEY (artist_sn)
		REFERENCES ARTIST(artist_sn)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
  	FOREIGN KEY (album_sn)
		REFERENCES ALBUM(album_sn)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

/*insert valused into artist, album, song table*/
INSERT INTO ARTIST(name, debut_date, type, gender)
VALUES
('IU', '2008-09-18', 'solo', 'female'),
('OH MY GIRL', '2015-04-20', 'group', 'female'),
('AKMU', '2014-04-07', 'group', 'mixed'),
('Paul Kim', '2014-01-21', 'solo', 'male'),
('Colde', '2016-09-21', 'solo', 'male'),
('George', '2016-03-16', 'solo', 'male'),
('JeA', '2006-03-02', 'solo', 'female');

INSERT INTO ALBUM(name, release_date, artist_sn)
VALUES
('Love poem', '2019-11-18', 1),
('Palette', '2017-04-21', 1),
('CLOSER', '2015-10-08', 2),
('WINDY DAY', '2016-05-26', 2),
('PLAY', '2014-04-07', 3),
('SUMMER EPISODE', '2017-07-20', 3),
('Rain', '2016-06-21', 4),
('Your Dog Loves You', '2018-03-28', 5),
('Love part1', '2019-05-31', 5),
('cassette', '2018-07-06', 6),
('LEEEE', '2019-10-03', 6),
('Greedyy', '2020-06-12', 7);

INSERT INTO SONG(title, genre, album_sn, artist_sn)
VALUES
('Blueming', 'rock/metal', 1,1),
('Lullaby', 'balad', 1,1),
('Black Out', 'dance', 2,1),
('Dear Name', 'balad', 2,1),
('CLOSER', 'dance',3,2),
('WINDY DAY', 'dance',4,2),
('LIAR LIAR', 'dance',4,2),
('Give Love', 'fork', 5,3),
('Galaxy', 'fork', 5,3),
('DINOSAUR', 'eletronic',6 ,3),
('Rain', 'R\&B', 7,4),
('Your Dog Loves You', 'R\&B',8 ,5),
('I fxxking love you', 'R\&B',9 ,5),
('Love is a Flower', 'R\&B',9,5),
('let\'s go picnic', 'R\&B',10,6),
('idkyet', 'R\&B',11,6),
('Greedyy', 'dance',12,7);

/*create index*/
CREATE INDEX artistname_index ON ARTIST(name);
CREATE INDEX albumname_index ON ALBUM(name);
CREATE INDEX genre_index ON SONG(genre);



/*create view (join 2 tables)*/
CREATE VIEW album_song(album_name, title, genre) AS
	SELECT name, title, genre 
	FROM ALBUM, SONG 
	WHERE ALBUM.artist_sn=SONG.artist_sn AND ALBUM.album_sn=SONG.album_sn;
