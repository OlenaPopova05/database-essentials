# Non-correlated queries

# Display the book that was published most recently and its publisher
SELECT b.title AS book_title, b.year, p.name AS publisher_name
FROM book b
         JOIN publisher p ON b.publisher_id = p.publisher_id
WHERE year = (
    SELECT MAX(year)
    FROM book
    );

# Display books that were written by authors from the United States
SELECT b.title AS book_title, b.isbn, b.edition, b.year, b.price
FROM book b
WHERE book_id IN (
    SELECT ba.book_id
    FROM book_author ba
             JOIN author a ON ba.author_id = a.author_id
    WHERE a.nationality = 'American'
);

# Display books that are not in the Romance genre
SELECT b.title AS book_title, b.isbn, b.edition, b.year, b.price
FROM book b
WHERE book_id NOT IN (
    SELECT bg.book_id
    FROM book_genre bg
    WHERE bg.genre_id = 5
);

# Display books that are in the Mystery genre
SELECT *
FROM book b
WHERE EXISTS (
    SELECT 1
    FROM genre g
    WHERE g.name = 'Mystery'
);

# Display the authors who have not written books in the Thriller genre
SELECT a.name AS author_name
FROM author a
WHERE NOT EXISTS (
    SELECT 1
    FROM genre g
    WHERE g.name = 'Thriller'
);

# Update the price of all books published by Penguin Random House to $21.99
UPDATE book
SET price = 21.99
WHERE publisher_id = (
    SELECT publisher_id
    FROM publisher
    WHERE name = 'Penguin Random House'
);

# Update the edition of all books published by Vintage Books to '2nd'
UPDATE book
SET edition = '2nd'
WHERE publisher_id IN (
    SELECT publisher_id
    FROM publisher
    WHERE name = 'Vintage Books'
);

# Update the edition of all books published before 2020 to 'Old Edition'
UPDATE book
SET edition = 'Old Edition'
WHERE book_id NOT IN (
    SELECT book_id
    FROM (SELECT book_id
          FROM book
          WHERE year >= 2020) AS subquery
);

# Update books that are currently on loan to 'Revised Edition'
UPDATE book
SET edition = 'Revised Edition'
WHERE EXISTS (
    SELECT 1
    FROM loan
    WHERE loan.book_id = book.book_id
      AND loan.return_date IS NULL
);

# Update the edition of all books that are not in the Mystery genre and were not published in 2024 to 'Regular Edition'
UPDATE book
SET edition = 'Regular Edition'
WHERE NOT EXISTS (
    SELECT 1
    FROM book_genre
             INNER JOIN genre ON book_genre.genre_id = genre.genre_id
    WHERE book_genre.book_id = book.book_id
              AND genre.name = 'Mystery' AND year != 2024
);

# Delete books published by Random House
DELETE FROM book_genre
WHERE book_id IN (
    SELECT book_id FROM book
    WHERE publisher_id = (
        SELECT publisher_id FROM publisher
        WHERE name = 'Random House'
    )
);

# Delete loans for customers with names starting with 'Ava'
DELETE FROM loan
WHERE customer_id IN (
    SELECT customer_id
    FROM customer
    WHERE name LIKE 'Ava%'
);

# Delete customers who have not borrowed any books
DELETE FROM customer
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM loan
);

# Delete loans that have not been returned
DELETE FROM book_loan
WHERE EXISTS (
    SELECT * FROM loan
    WHERE loan.loan_id = book_loan.loan_id
      AND loan.return_date IS NULL
);

# Delete customers who have not borrowed any books
DELETE FROM customer
WHERE NOT EXISTS (
    SELECT * FROM loan
    WHERE loan.customer_id = customer.customer_id
);

#Correlated queries

# Display the books that have the same title as their publisher
SELECT *
FROM book b
WHERE b.publisher_id = (
    SELECT publisher_id
    FROM publisher p
    WHERE p.name = b.title
);

# Display loans that have loan dates before July 1, 2024
SELECT *
FROM loan l
WHERE l.book_id IN (
    SELECT book_id
    FROM book
    WHERE loan_date < '2024-07-01'
);

# Display loans that do not have books with due dates before July 1, 2024
SELECT *
FROM loan l
WHERE l.book_id NOT IN (
    SELECT book_id
    FROM book
    WHERE due_date < '2024-07-01'
);

# Display the publishers that have published books in 2023 or later
SELECT p.name AS publisher_name
FROM publisher p
WHERE EXISTS (
    SELECT 1
    FROM book b
    WHERE b.publisher_id = p.publisher_id
      AND b.year >= 2023
);

# Display customers who have not borrowed any books
SELECT DISTINCT c.name
FROM customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM loan l
    WHERE l.customer_id = c.customer_id
);

# Update the price of all books to the average price of books they are currently on loan
UPDATE book b
SET price = (
    SELECT AVG(price)
    FROM book_loan bl
             JOIN loan l ON bl.loan_id = l.loan_id
    WHERE bl.book_id = b.book_id
)
WHERE EXISTS (
    SELECT *
    FROM book_loan bl
             JOIN loan l ON bl.loan_id = l.loan_id
    WHERE bl.book_id = b.book_id
);

# Update the price of all books published if publisher_id is the same as book_id to 10% higher
UPDATE book b1
SET price = price * 1.1
WHERE publisher_id IN (
    SELECT publisher_id
    FROM publisher
    WHERE b1.publisher_id = b1.book_id
);

# Update the price of all books published if publisher_id is not the same as book_id to 10% higher
UPDATE book b1
SET price = price * 1.1
WHERE publisher_id NOT IN (
    SELECT publisher_id
    FROM publisher
    WHERE b1.publisher_id = b1.book_id
);

# Update the edition of all books published by publishers that have published books in 2024 to 'Special Edition'
UPDATE book AS b
SET edition = 'Special Edition'
WHERE EXISTS (
    SELECT 1
    FROM (SELECT publisher_id
          FROM book
          WHERE year = 2024) AS subquery
    WHERE subquery.publisher_id = b.publisher_id
);

# Update the edition of all books that are not published by publishers that have published books in 2024 to 'Special Edition'
UPDATE book AS b
SET edition = 'Special Edition'
WHERE NOT EXISTS (
    SELECT 1
    FROM (SELECT publisher_id
          FROM book
          WHERE year = 2024) AS subquery
    WHERE subquery.publisher_id = b.book_id
);

# Delete books with the minimum price for each publisher
DELETE b
FROM book b
WHERE b.price = (
    SELECT MIN(price)
    FROM book
    WHERE publisher_id = b.publisher_id
);

# Delete authors who have written books published in 2020 or earlier
DELETE FROM author
WHERE author_id IN (
    SELECT DISTINCT author_id
    FROM book_author ba
    WHERE EXISTS (
        SELECT 1
        FROM book b
        WHERE b.book_id = ba.book_id
          AND b.year <= 2020
    )
);

# Delete authors who have not written books published in 2020 or later
DELETE FROM author
WHERE author_id NOT IN (
    SELECT DISTINCT author_id
    FROM book_author ba
    WHERE EXISTS (
        SELECT 1
        FROM book b
        WHERE b.book_id = ba.book_id
          AND b.year >= 2020
    )
);

# Delete publishers that have published any books
DELETE FROM publisher
WHERE EXISTS (
    SELECT 1
    FROM book
    WHERE book.publisher_id = publisher.publisher_id
);

# Delete publishers that have not published any books
DELETE FROM publisher
WHERE NOT EXISTS (
    SELECT 1
    FROM book
    WHERE book.publisher_id = publisher.publisher_id
);


SELECT book_id FROM book
UNION
SELECT book_id FROM loan
ORDER BY book_id;

SELECT title FROM book
UNION ALL
SELECT name FROM publisher
ORDER BY title;

SELECT name FROM customer WHERE customer_id IN
(SELECT customer_id FROM loan WHERE return_date IS NOT NULL)
INTERSECT
SELECT name FROM customer WHERE customer_id IN
(SELECT customer_id FROM loan);

SELECT title FROM book WHERE book_id IN
(SELECT book_id FROM book_genre WHERE genre_id =
(SELECT genre_id FROM genre WHERE name = 'Science Fiction'))
EXCEPT
SELECT title FROM book WHERE book_id IN
(SELECT book_id FROM loan);