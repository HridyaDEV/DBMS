CREATE TABLE Artists (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL
);

CREATE TABLE Songs (
    song_id INT PRIMARY KEY,
    song_name VARCHAR(100) NOT NULL,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Playlists (
    playlist_id INT PRIMARY KEY,
    user_id INT,
    song_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

INSERT INTO Artists (artist_id, artist_name, genre) VALUES 
(1, 'The Beatles', 'Rock'),
(2, 'Taylor Swift', 'Pop'),
(3, 'AC/DC', 'Rock');

INSERT INTO Songs (song_id, song_name, artist_id) VALUES 
(1, 'Let It Be', 1),
(2, 'Love Story', 2),
(3, 'Highway to Hell', 3);

INSERT INTO Users (user_id, user_name, email) VALUES 
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', 'bob@example.com');

INSERT INTO Playlists (playlist_id, user_id, song_id) VALUES
(1, 1, 1),
(2, 2, 2);

SELECT Users.user_name, Songs.song_name
FROM Playlists
INNER JOIN Users ON Playlists.user_id = Users.user_id
INNER JOIN Songs ON Playlists.song_id = Songs.song_id;



SELECT Songs.song_name, Users.user_name
FROM Songs
LEFT JOIN Playlists ON Songs.song_id = Playlists.song_id
LEFT JOIN Users ON Playlists.user_id = Users.user_id;


SELECT Songs.song_name, Artists.artist_name
FROM Songs
INNER JOIN Artists ON Songs.artist_id = Artists.artist_id
INNER JOIN Playlists ON Songs.song_id = Playlists.song_id
WHERE Artists.genre = 'Rock';





