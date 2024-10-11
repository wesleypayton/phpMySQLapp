-- Remove time zone configuration to avoid Docker execution errors

USE moviedb;

-- Table structure for `movies`
DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `_title` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `release_year` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert data into `movies`
INSERT INTO `movies` (`_title`, `director`, `release_year`, `country`) VALUES
('The Shawshank Redemption', 'Frank Darabont', 1994, 'USA'),
('The Godfather', 'Francis Ford Coppola', 1972, 'USA'),
('The Dark Knight', 'Christopher Nolan', 2008, 'USA'),
('Pulp Fiction', 'Quentin Tarantino', 1994, 'USA'),
('The Lord of the Rings: The Return of the King', 'Peter Jackson', 2003, 'New Zealand');

-- Table structure for `genres`
DROP TABLE IF EXISTS `genres`;
CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(255) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert data into `genres`
INSERT INTO `genres` (`genre_name`) VALUES
('Drama'),
('Action'),
('Crime'),
('Fantasy'),
('Thriller');

-- Table structure for `movie_genre_relationship`
DROP TABLE IF EXISTS `movie_genre_relationship`;
CREATE TABLE `movie_genre_relationship` (
  `_movie_id` int(11) NOT NULL,
  `_genre_id` int(11) NOT NULL,
  FOREIGN KEY (`_movie_id`) REFERENCES `movies` (`_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`_genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert data into `movie_genre_relationship`
INSERT INTO `movie_genre_relationship` (`_movie_id`, `_genre_id`) VALUES
(1, 1), -- The Shawshank Redemption - Drama
(2, 3), -- The Godfather - Crime
(3, 2), -- The Dark Knight - Action
(4, 3), -- Pulp Fiction - Crime
(5, 4); -- The Lord of the Rings: The Return of the King - Fantasy