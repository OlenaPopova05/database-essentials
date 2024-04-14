# Procedure to check if a book is available for loan and create a loan if it is, else display a message
DELIMITER //
CREATE PROCEDURE create_loan(
    IN customer_id INT,
    IN book_title VARCHAR(100),
    IN loan_date DATE,
    IN due_date DATE
)
BEGIN
    DECLARE book_id INT;
    DECLARE available BOOLEAN;

START TRANSACTION;

SELECT b.book_id
INTO book_id
FROM book b
WHERE b.title = book_title;

SELECT EXISTS (
    SELECT 1
    FROM loan l
    WHERE l.book_id = book_id
      AND l.return_date IS NULL
)
INTO available;

IF available THEN
        INSERT INTO loan (customer_id, book_id, loan_date, due_date)
        VALUES (customer_id, book_id, loan_date, due_date);
COMMIT;
ELSE
        ROLLBACK;
SELECT 'Book is not available for loan.' AS message;
END IF;
END //
DELIMITER ;


CALL create_loan(1, 'Galactic Odyssey', '2024-08-01', '2024-08-15');