# Procedure checks the return date of a book based on its title
DELIMITER //
CREATE PROCEDURE check_return_date(
    IN book_title VARCHAR(100)
)
BEGIN
SELECT l.return_date
FROM loan l
WHERE l.book_id = (
    SELECT b.book_id
    FROM book b
    WHERE b.title = book_title
);
END //
DELIMITER ;

CALL check_return_date('The Enigma');


# Procedure to display the titles of books that are currently available
DELIMITER //
CREATE PROCEDURE available_books(
    OUT book_titles TEXT
)
BEGIN
    DECLARE titles TEXT DEFAULT '';
SELECT GROUP_CONCAT(b.title SEPARATOR ', ')
INTO titles
FROM book b
WHERE b.book_id NOT IN (
    SELECT l.book_id
    FROM loan l
    WHERE l.return_date IS NULL
);
SET book_titles = titles;
END //
DELIMITER ;

CALL available_books(@book_titles);
SELECT @book_titles;


# Procedure to display the names of authors for a given book title
DELIMITER //
CREATE PROCEDURE author_for_book(
    INOUT book_title VARCHAR(100)
)
BEGIN
SELECT GROUP_CONCAT(a.name) AS author_name
INTO book_title
FROM author a
         JOIN book_author ba ON a.author_id = ba.author_id
         JOIN book b ON ba.book_id = b.book_id
WHERE b.title = book_title;
END //
DELIMITER ;

SET @book_title = 'The Enigma';
CALL author_for_book(@book_title);
SELECT @book_title;