#  Display the information about books along with their associated genres
SELECT
    book.title AS book_title,
    book.year AS book_year,
    GROUP_CONCAT(genre.name) AS genre_names
FROM book_genre
         JOIN book ON book_genre.book_id = book.book_id
         JOIN genre ON book_genre.genre_id = genre.genre_id
GROUP BY
    book.title,
    book.year
ORDER BY
    book.title;

# Display information about authors along with the titles of the books they have written
SELECT
    author.name AS author_name,
    author.nationality AS author_nationality,
    GROUP_CONCAT(book.title) AS authored_books
FROM book_author
         JOIN author ON book_author.author_id = author.author_id
         JOIN book ON book_author.book_id = book.book_id
GROUP BY
    author.name,
    author.nationality
ORDER BY
    author.name;