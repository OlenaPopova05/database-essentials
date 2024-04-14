#Find the top 5 genres with the highest average book prices
SELECT g.name
FROM genre g
         JOIN book b ON g.genre_id = b.genre_id
GROUP BY g.name
ORDER BY AVG(b.price) DESC
    LIMIT 5;

#Find customers who have borrowed more than 3 books, ordered by the number of books borrowed
SELECT c.name, COUNT(l.book_id) AS books_borrowed_number
FROM customer c
         JOIN loan l ON c.customer_id = l.customer_id
GROUP BY c.name
HAVING COUNT(l.book_id) > 1
ORDER BY books_borrowed_number DESC;

#List authors who have written books in more than one genre
SELECT a.name, COUNT(DISTINCT b.genre_id) AS genres_written
FROM author a
         JOIN book b ON a.author_id = b.author_id
GROUP BY a.name
HAVING COUNT(DISTINCT b.genre_id) > 1;