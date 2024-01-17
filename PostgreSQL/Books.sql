-- Create Authors Table
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Create Books Table
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    published_year INT,
    isbn VARCHAR(20) UNIQUE,
    genre VARCHAR(50)
);

-- Create Book_Authors Table
CREATE TABLE book_authors (
    book_id INT REFERENCES books(book_id),
    author_id INT REFERENCES authors(author_id),
    PRIMARY KEY (book_id, author_id)
);

-- Insert Sample Data into Authors Table
INSERT INTO authors (first_name, last_name, email)
VALUES
('Jane', 'Doe', 'jane.doe@example.com'),
('John', 'Smith', 'john.smith@example.com'),
('Alice', 'Johnson', 'alice.johnson@example.com');

-- Insert Sample Data into Books Table
INSERT INTO books (title, published_year, isbn, genre)
VALUES
('The Great Gatsby', 1925, '978-0-7432-7356-5', 'Fiction'),
('To Kill a Mockingbird', 1960, '978-0-06-112008-4', 'Drama'),
('1984', 1949, '978-0-452-28423-4', 'Dystopian');

-- Insert Sample Data into Book_Authors Table
INSERT INTO book_authors (book_id, author_id)
VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 3);

SELECT b.title, b.published_year, b.isbn, b.genre, a.first_name, a.last_name
FROM books b
JOIN book_authors ba ON b.book_id = ba.book_id
JOIN authors a ON ba.author_id = a.author_id;

Find the number of books each author has written:
SELECT a.first_name, a.last_name, COUNT(ba.book_id) AS num_books_written
FROM authors a
LEFT JOIN book_authors ba ON a.author_id = ba.author_id
GROUP BY a.first_name, a.last_name;

Retrieve books published in a specific genre:
SELECT *
FROM books
WHERE genre = 'Drama';

