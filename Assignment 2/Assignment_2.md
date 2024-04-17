# :two: Assignment 

## :speech_balloon: Task

> Add to the [existing database](https://github.com/OlenaPopova05/database-essentials/blob/main/Assignment%201/database.sql):
> * One-to-many relationships using Primary key-Foreign key relationship.
> * Many-to-many relationships using Junction Tables.
>   
> Write [two queries](https://github.com/OlenaPopova05/database-essentials/blob/main/Assignment%202/queries.sql) with JOINs.

## :seedling: Description

> * *Book:* This table has a foreign key, publisher_id, that references the Publisher table.
> * *Author:* This table has a many-to-many relationship with the Book table, meaning that each book can have multiple authors, and each author can have written multiple books. To represent this relationship, you will need to create a junction table book_author, that stores the pairs of book_id and author_id.
> * *Publisher:* This table has a one-to-many relationship with the Book table.
> * *Genre:* This table has a many-to-many relationship with the Book table, meaning that each book can belong to multiple genres, and each genre can have multiple books. To represent this relationship, you will need to create a junction table book_genre, that stores the pairs of book_id and genre_id.
> * *Customer:* This table has a one-to-many relationship with the Loan table, meaning that each customer can have multiple loans, and each loan belongs to one customer.
> * *Loan:* This table has multiple foreign keys: first is customer_id. Also, this table has a many-to-many relationship with the Book table, meaning that each loan can include multiple books, and each book can be present in different loans. To represent this relationship, you will need to create a junction table book_loan, that stores the pairs of book_id and loan_id.


[Here you can see the updated database.](https://github.com/OlenaPopova05/database-essentials/blob/main/Assignment%202/database.sql)

[And here its diagram.](https://github.com/OlenaPopova05/database-essentials/blob/main/Assignment%202/database_diagram.png)

## :books: Theory

* [Relationships When Designing A Database](https://medium.com/@emekadc/how-to-implement-one-to-one-one-to-many-and-many-to-many-relationships-when-designing-a-database-9da2de684710)
* [Junction Tables](https://medium.com/@RayRay504/junction-tables-c6af9436e1bf)
