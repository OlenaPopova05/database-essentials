# A view which displays the set of rented books
CREATE VIEW rented_books AS
SELECT b.title,
       GROUP_CONCAT(a.name) AS authors,
       GROUP_CONCAT(p.name, ', ', b.year) AS publisher_year,
       DATE_FORMAT(l.loan_date, '%b, %d %Y') AS loan_date,
       DATEDIFF(l.due_date, l.loan_date) AS days_to_end_of_term
FROM book b
         JOIN book_author ba ON b.book_id = ba.book_id
         JOIN author a ON ba.author_id = a.author_id
         JOIN publisher p ON b.publisher_id = p.publisher_id
         JOIN loan l ON b.book_id = l.book_id
WHERE l.return_date IS NULL
GROUP BY b.book_id, l.loan_id;