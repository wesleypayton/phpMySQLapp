USE bookstore;

-- Create the `category` table
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(45) NOT NULL,
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_id_UNIQUE` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert data into `category`
INSERT INTO `category` (`cat_id`, `cat_title`) VALUES
(1, 'Award Winners'), (2, 'Biographies and Memoirs'), (3, 'Computers and Technology'),
(4, 'Literature and Fiction'), (5, 'Mystery, Thriller and Suspense'), (6, 'Romance'),
(8, 'Children Book'), (9, 'Health, Fitness and Dieting'), (10, 'Science and Math'),
(11, 'Fantasy'), (19, 'Test Preparation'), (21, 'Self-Help');

-- Create the `books` table
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `_title` varchar(45) NOT NULL,
  `author_name` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `release_year` int(11) NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `product_id_UNIQUE` (`_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert data into `books`
INSERT INTO `books` VALUES 
(1, 'The Philosopher\'s Stone', 'J. K. Rowling', 'UK', 1997),
(2, 'The Chamber of Secrets', 'J. K. Rowling', 'UK', 1998),
(3, 'The Prisoner of Azkaban', 'J. K. Rowling', 'UK', 1999),
(4, 'The Goblet of Fire', 'J. K. Rowling', 'UK', 2000),
(5, 'The Order of the Phoenix', 'J. K. Rowling', 'UK', 2003),
(6, 'The Half-Blood Prince', 'J. K. Rowling', 'UK', 2005),
(7, 'The Deathly Hallows', 'J. K. Rowling', 'UK', 2007),
(8, 'American Gods', 'Neil Gaiman', 'UK', 2001),
(14, 'Introduction to Algorithms', 'Thomas H. Cormen', 'USA', 1990),
(15, 'The Underground Railroad', 'Colson Whitehead', 'USA', 2016),
(16, 'The Magic', 'Rhonda Byrne', 'USA', 2012),
(17, 'Srikanta', 'Sarat Chandra Chattopadhyay', 'India', 1917),
(18, 'CyberStorm', 'Matthew Mather', 'USA', 2013),
(19, 'Alice in Wonderland', 'Lewis Carroll', 'UK', 1865);

-- Create the `book_category_relationship` table
DROP TABLE IF EXISTS `book_category_relationship`;
CREATE TABLE `book_category_relationship` (
  `_book_id` int(11) DEFAULT NULL,
  `_cat_id` int(11) DEFAULT NULL,
  KEY `bookID_idx` (`_book_id`),
  KEY `catID_idx` (`_cat_id`),
  CONSTRAINT `bookID` FOREIGN KEY (`_book_id`) REFERENCES `books` (`_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `catID` FOREIGN KEY (`_cat_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert data into `book_category_relationship`
INSERT INTO `book_category_relationship` VALUES 
(2, 11), (3, 11), (4, 11), (5, 11), (6, 11), (7, 11), 
(2, 4), (3, 4), (4, 4), (5, 4), (6, 4), (7, 4), 
(1, 11), (1, 4), (8, 11), (14, 3), (15, 1), (15, 4), 
(16, 21), (17, 4), (17, 6), (18, 5), (19, 8), (19, 11);
