CREATE SCHEMA assignment_1;
USE assignment_1;

CREATE TABLE genre
(
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL
);

CREATE TABLE author
(
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    biography VARCHAR(100) NOT NULL
);

CREATE TABLE publisher
(
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    website VARCHAR(100) NOT NULL
);

CREATE TABLE book
(
    genre_id INT,
    author_id INT,
    publisher_id INT,
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    isbn VARCHAR(100) NOT NULL,
    edition VARCHAR(100) NOT NULL,
    year INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (genre_id) REFERENCES genre (genre_id) ,
    FOREIGN KEY (author_id) REFERENCES author (author_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id)
)AUTO_INCREMENT = 1;

CREATE TABLE customer
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE loan
(
    customer_id INT,
    book_id INT,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    FOREIGN KEY (book_id) REFERENCES book (book_id)
);

INSERT INTO genre(name, description)VALUES
('Fiction', 'Imaginative and creative storytelling.'),
('Mystery', 'Engaging and suspenseful plotlines.'),
('Science Fiction', 'Speculative and futuristic themes.'),
('Historical Fiction', 'Stories set in the past, blending fact and fiction.'),
('Romance', 'Focus on love and romantic relationships.');

INSERT INTO publisher(name, address, phone, website)VALUES
('Penguin Random House', '123 Book Street, Cityville, USA', '+1 555-1234', 'https://www.penguinrandomhouse.com/'),
('HarperCollins Publishers', '456 Novel Avenue, Bookland, USA', '+1 555-5678', 'https://www.harpercollins.com/'),
('Houghton Mifflin Harcourt', '789 Literary Lane, Storyville, USA', '+1 555-9101', 'https://www.hmhco.com/'),
('Oxford University Press', '101 Academic Road, Scholar City, UK', '+44 20 1234 5678', 'https://global.oup.com/'),
('Simon & Schuster', '202 Story Street, Novel City, USA', '+1 555-1122', 'https://www.simonandschuster.com/'),
('Random House', '303 Fiction Road, Taleville, USA', '+1 555-3344', 'https://www.randomhouse.com/'),
('Bloomsbury Publishing', '404 Fantasy Avenue, Imaginaria, UK', '+44 20 5678 9101', 'https://www.bloomsbury.com/'),
('Vintage Books', '505 Classic Lane, Literatureville, USA', '+1 555-5566', 'https://www.vintagebooks.com/'),
('Scribner', '606 Page Street, Paperland, USA', '+1 555-7788', 'https://www.scribner.com/'),
('Alfred A. Knopf', '707 Hardcover Hill, Bindington, USA', '+1 555-9900', 'https://www.aa-knopf.com/');


INSERT INTO author(name, date_of_birth, nationality, biography) VALUES
('John Smith', '1970-05-15', 'American', 'Renowned author with a passion for storytelling.'),
('Emily Johnson', '1985-09-22', 'British', 'Prolific writer known for her diverse genres.'),
('Michael Rodriguez', '1978-03-10', 'Spanish', 'Bestselling author with a global fan base.'),
('Sarah Brown', '1980-07-12', 'Canadian', 'Award-winning novelist exploring various themes.'),
('Daniel Kim', '1975-11-28', 'South Korean', 'Acclaimed author with a unique storytelling style.'),
('Patricia Miller', '1988-04-18', 'Australian', 'Emerging writer with a fresh perspective.'),
('Roberto Sanchez', '1972-08-05', 'Mexican', 'Author of gripping mysteries and thrillers.'),
('Lisa Thompson', '1982-01-30', 'Irish', 'Best known for her heartwarming literary works.'),
('Ahmed Al-Farsi', '1977-06-17', 'Saudi Arabian', 'Internationally recognized author and poet.'),
('Julia Martinez', '1983-09-03', 'French', 'Talented novelist exploring historical fiction.');

INSERT INTO book (author_id, genre_id, publisher_id, title, isbn, edition, year, price) VALUE
(1, 1, 1, 'The Enigma', '978-1-234567-1', '1st', 2020, 25.99),
(2, 2, 2, 'Secrets Unveiled', '978-2-345678-2', '2nd', 2018, 19.99),
(3, 3, 3, 'Galactic Odyssey', '978-3-456789-3', '1st', 2022, 29.99),
(4, 4, 4, 'Shattered Illusions', '978-4-567890-4', '3rd', 2019, 22.50),
(5, 5, 5, 'Echoes of Eternity', '978-5-678901-5', '2nd', 2021, 27.50),
(6, 1, 6, 'The Forgotten Realm', '978-6-789012-6', '1st', 2023, 32.99),
(7, 2, 7, 'Whispers in the Dark', '978-7-890123-7', '4th', 2017, 18.50),
(8, 3, 8, 'Quantum Mirage', '978-8-901234-8', '2nd', 2020, 26.99),
(9, 4, 9, 'Serenity''s Edge', '978-9-012345-9', '3rd', 2018, 21.50),
(10, 5, 10, 'Shadows of Tomorrow', '978-0-123456-0', '1st', 2022, 28.99),
(1, 2, 1, 'Midnight Conspiracies', '978-1-234567-1', '2nd', 2019, 23.50),
(2, 1, 2, 'Beyond the Horizon', '978-2-345678-2', '1st', 2021, 29.99),
(3, 3, 3, 'Enchanted Realms', '978-3-456789-3', '3rd', 2023, 31.50),
(4, 4, 4, 'Arcane Chronicles', '978-4-567890-4', '2nd', 2017, 20.99),
(5, 5, 5, 'Nexus of Destiny', '978-5-678901-5', '1st', 2020, 25.50),
(6, 1, 6, 'A Trail of Shadows', '978-6-789012-6', '4th', 2018, 24.99),
(7, 2, 7, 'Celestial Pursuit', '978-7-890123-7', '2nd', 2022, 27.99),
(8, 3, 8, 'Elysium Reborn', '978-8-901234-8', '1st', 2019, 22.99),
(9, 4, 9, 'The Whispering Grove', '978-9-012345-9', '3rd', 2021, 28.50),
(10, 5, 10,'Veil of Shadows', '978-0-123456-0', '1st', 2023, 30.50),
(1, 3, 1, 'Astral Visions', '978-1-234567-1', '2nd', 2017, 21.99),
(2, 4, 2, 'Echoes from the Abyss', '978-2-345678-2', '1st', 2020, 26.50),
(3, 5, 3, 'The Ephemeral Key', '978-3-456789-3', '3rd', 2018, 23.99),
(4, 1, 4, 'Quantum Paradox', '978-4-567890-4', '2nd', 2022, 28.50),
(5, 2, 5, 'Vortex of Illusions', '978-5-678901-5', '1st', 2019, 24.99),
(6, 3, 6, 'Chronicles of Infinity', '978-6-789012-6', '4th', 2021, 32.50),
(7, 4, 7, 'Enigma''s Awakening', '978-7-890123-7', '2nd', 2023, 34.99),
(8, 5, 8, 'Whispers Beyond Time', '978-8-901234-8', '1st', 2017, 20.50),
(9, 1, 9, 'Quantum Echoes', '978-9-012345-9', '3rd', 2020, 27.50),
(10, 2, 10, 'Shattered Realms', '978-0-123456-0', '1st', 2024, 26.50);


INSERT INTO customer (name, address, phone, email, password) VALUES
('John Doe', '123 Main Street, Cityville, USA', '+1 555-1234', 'john.doe@example.com', 'password123'),
('Jane Smith', '456 Library Lane, Bookland, USA', '+1 555-5678', 'jane.smith@example.com', 'securepass789'),
('Bob Johnson', '789 Reader Road, Storyville, USA', '+1 555-9101', 'bob.johnson@example.com', 'strongpassword456'),
('Alice Williams', '101 Bookworm Avenue, Taleville, USA', '+1 555-1122', 'alice.williams@example.com', 'password987'),
('Charlie Brown', '202 Literary Street, Novel City, USA', '+1 555-3344', 'charlie.brown@example.com', 'librarian123'),
('Emma Davis', '303 Page Place, Paperland, USA', '+1 555-5566', 'emma.davis@example.com', 'reader456'),
('Michael White', '404 Fiction Street, Imaginaria, USA', '+1 555-7788', 'michael.white@example.com', 'booklover789'),
('Olivia Green', '505 Novel Avenue, Storyville, USA', '+1 555-9900', 'olivia.green@example.com', 'novelist123'),
('William Turner', '606 Writer Road, Taleville, USA', '+1 555-1122', 'william.turner@example.com', 'writer456'),
('Sophia Hall', '707 Prose Place, Paperland, USA', '+1 555-3344', 'sophia.hall@example.com', 'libraryuser789'),
('Liam Martin', '808 Verse Village, Poetown, USA', '+1 555-5566', 'liam.martin@example.com', 'poetrylover123'),
('Ava Wilson', '909 Story Street, Novel City, USA', '+1 555-7788', 'ava.wilson@example.com', 'storyteller456'),
('Noah Adams', '111 Reader Road, Bookland, USA', '+1 555-9900', 'noah.adams@example.com', 'avidreader789'),
('Isabella Lee', '222 Library Lane, Cityville, USA', '+1 555-1122', 'isabella.lee@example.com', 'bookish123'),
('Mia Harris', '333 Bookworm Boulevard, Taleville, USA', '+1 555-3344', 'mia.harris@example.com', 'bookworm456'),
('Ethan Turner', '444 Novel Avenue, Storyville, USA', '+1 555-5566', 'ethan.turner@example.com', 'litlover789'),
('Sophie Scott', '555 Prose Place, Paperland, USA', '+1 555-7788', 'sophie.scott@example.com', 'bibliophile123'),
('Jackson White', '666 Story Street, Imaginaria, USA', '+1 555-9900', 'jackson.white@example.com', 'booknerd456'),
('Olivia Turner', '777 Writer Road, Taleville, USA', '+1 555-1122', 'olivia.turner@example.com', 'bookish123'),
('Lucas Martin', '888 Reader Road, Bookland, USA', '+1 555-3344', 'lucas.martin@example.com', 'literature456'),
('Ava Davis', '999 Bookworm Avenue, Cityville, USA', '+1 555-5566', 'ava.davis@example.com', 'booklover789'),
('Aiden Smith', '121 Prose Place, Storyville, USA', '+1 555-7788', 'aiden.smith@example.com', 'bookenthusiast123'),
('Chloe Harris', '232 Novel Avenue, Taleville, USA', '+1 555-9900', 'chloe.harris@example.com', 'readingisfun456'),
('Liam Turner', '343 Library Lane, Paperland, USA', '+1 555-1122', 'liam.turner@example.com', 'noveladdict123'),
('Emma Adams', '454 Story Street, Novel City, USA', '+1 555-3344', 'emma.adams@example.com', 'litfan456'),
('Olivia Hall', '565 Fiction Street, Imaginaria, USA', '+1 555-5566', 'olivia.hall@example.com', 'bookdevotee789'),
('Sophia White', '676 Page Place, Cityville, USA', '+1 555-7788', 'sophia.white@example.com', 'literarysoul123'),
('Jackson Harris', '787 Verse Village, Taleville, USA', '+1 555-9900', 'jackson.harris@example.com', 'bookishdreamer456'),
('Aiden Turner', '898 Library Lane, Storyville, USA', '+1 555-1122', 'aiden.turner@example.com', 'bookloveratheart123'),
('Chloe Davis', '909 Bookworm Avenue, Taleville, USA', '+1 555-3344', 'chloe.davis@example.com', 'novelenthusiast456');

INSERT INTO loan (customer_id, book_id, loan_date, due_date, return_date) VALUE
(1, 1, '2024-06-01', '2024-06-15', '2024-06-10'),
(2, 2, '2024-06-03', '2024-06-17', '2024-06-16'),
(3, 3, '2024-06-05', '2024-06-19', NULL),
(4, 4, '2024-06-07', '2024-06-21', '2024-06-20'),
(5, 5, '2024-06-09', '2024-06-23', '2024-06-22'),
(6, 6, '2024-06-11', '2024-06-25', NULL),
(7, 7, '2024-06-13', '2024-06-27', '2024-06-26'),
(8, 8, '2024-06-15', '2024-07-01', '2024-07-01'),
(9, 9, '2024-06-17', '2024-07-03', '2024-07-02'),
(10, 10, '2024-06-19', '2024-07-05', NULL),
(11, 11, '2024-06-21', '2024-07-07', '2024-07-06'),
(12, 12, '2024-06-23', '2024-07-09', '2024-07-08'),
(13, 13, '2024-06-25', '2024-07-11', NULL),
(14, 14, '2024-06-27', '2024-07-13', NULL),
(15, 15, '2024-06-29', '2024-07-15', '2024-07-14'),
(16, 16, '2024-07-01', '2024-07-17', '2024-07-16'),
(17, 17, '2024-07-03', '2024-07-19', '2024-07-18'),
(18, 18, '2024-07-05', '2024-07-21', NULL),
(19, 19, '2024-07-07', '2024-07-23', '2024-07-22'),
(20, 20, '2024-07-09', '2024-07-25', '2024-07-24'),
(21, 21, '2024-07-11', '2024-07-27', '2024-07-26'),
(22, 22, '2024-07-13', '2024-08-01', NULL),
(23, 23, '2024-07-15', '2024-08-03', '2024-08-02'),
(24, 24, '2024-07-17', '2024-08-05', '2024-08-04'),
(25, 25, '2024-07-19', '2024-08-07', '2024-08-06'),
(26, 26, '2024-07-21', '2024-08-09', NULL),
(27, 27, '2024-07-23', '2024-08-11', '2024-08-10'),
(28, 28, '2024-07-25', '2024-08-13', '2024-08-12'),
(29, 29, '2024-07-27', '2024-08-15', NULL),
(30, 30, '2024-07-29', '2024-08-17', '2024-08-16'),
(7, 9, '2024-07-31', '2024-08-19', '2024-08-18'),
(3, 8, '2024-08-02', '2024-08-21', NULL),
(1, 1, '2024-08-04', '2024-08-23', '2024-08-22'),
(2, 2, '2024-08-06', '2024-08-25', '2024-08-24'),
(3, 3, '2024-08-08', '2024-08-27', NULL),
(4, 4, '2024-08-10', '2024-09-01', '2024-08-31'),
(5, 5, '2024-08-12', '2024-09-03', '2024-09-02'),
(6, 6, '2024-08-14', '2024-09-05', '2024-09-04'),
(7, 7, '2024-08-16', '2024-09-07', NULL);