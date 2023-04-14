CREATE DATABASE MusicInfo;
USE MusicInfo;


CREATE TABLE record_labels (
  id int unsigned  not null PRIMARY KEY,
  name varchar(50) not null
);


INSERT INTO record_labels VALUES(1,'Empire Records');
INSERT INTO record_labels VALUES(2,'Legacy Records');
INSERT INTO record_labels VALUES(3,'Roc Nation');
INSERT INTO record_labels VALUES(4,'Native Records');
INSERT INTO record_labels VALUES(5,'DMW');
INSERT INTO record_labels VALUES(6,'We the best Music');


CREATE TABLE artists (
  id int unsigned not null PRIMARY KEY,
  record_label_id int unsigned not null,
  artist_name varchar(50) not null,
  KEY fk_record_label_in_artist (record_label_id),
  CONSTRAINT fk_record_label_in_artist FOREIGN KEY (record_label_id) REFERENCES record_label (id)
);


INSERT INTO artists VALUES(1, 1,'Burna Boy');
INSERT INTO artists VALUES(2, 1,'Davido');
INSERT INTO artists VALUES(3, 1,'Wizkid');
INSERT INTO artists VALUES(4, 2,'Kanye West');
INSERT INTO artists VALUES(5, 2,'Taylor Swift');
INSERT INTO artists VALUES(6, 2,'Grateful Dead');
INSERT INTO artists VALUES(7, 3,'Alicia Keys');
INSERT INTO artists VALUES(8, 4,'Drake');
INSERT INTO artists VALUES(9, 6,'One Direction');


CREATE TABLE albums (
  id int unsigned not null PRIMARY KEY auto_increment,
  artist_id int unsigned not null,
  name varchar(50)  not null,
  year int unsigned not null,
  KEY fk_artist_in_album (artist_id),
  CONSTRAINT fk_artist_in_album FOREIGN KEY (artist_id) REFERENCES artist (id)
);

INSERT INTO albums VALUES(1, 1, 'Twice as Tall',2020);
INSERT INTO albums VALUES(2, 1, 'Love, Damini',2022);
INSERT INTO albums VALUES(3, 1, 'Outside',2018);
INSERT INTO albums VALUES(4, 2, 'Timeless',2023);
INSERT INTO albums VALUES(5, 2, 'AGT',2018);
INSERT INTO albums VALUES(6, 3, 'Made In Lagos',2022);
INSERT INTO albums VALUES(7, 4, 'Donda',2021);
INSERT INTO albums VALUES(8, 4, 'Yeezus',2015);
INSERT INTO albums VALUES(9, 5, 'Taylor Swift Greatest Hits',2020);
INSERT INTO albums VALUES(10, 6, 'Undead',2004);
INSERT INTO albums VALUES(11, 7, 'All-Time Greatest Hits',2008);
INSERT INTO albums VALUES(12, 8, 'Her Loss',2022);
INSERT INTO albums VALUES(13, 9, 'Heartbreak Club', 2013);

CREATE TABLE songs (
  id int unsigned not null PRIMARY KEY,
  album_id int unsigned not null,
  name varchar(50) not null,
  duration real not null,
  KEY fk_album_in_song (album_id),
  CONSTRAINT fk_album_in_song FOREIGN KEY (album_id) REFERENCES album (id)
);


INSERT INTO songs VALUES(1,1,'23',3.25);
INSERT INTO songs VALUES(2,1,'Way Too Big',2.42);
INSERT INTO songs VALUES(3,2,'Last Last',3.3);
INSERT INTO songs VALUES(4,2,'Rollercoaster',2.59);

INSERT INTO songs VALUES(5,4,'Jesus Lord',8.26);
INSERT INTO songs VALUES(6,4,'Off The Grid',5.57);


show tables;