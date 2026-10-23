SELECT USER FROM dual;


CREATE TABLE BOOK
(
    book_id NUMBER(10) PRIMARY KEY,
    title VARCHAR2(255) NOT NULL,
    isbn VARCHAR2(20) UNIQUE NOT NULL,
    published_year NUMBER(4)
);


CREATE TABLE AUTHOR
(
    author_id NUMBER(10) PRIMARY KEY,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL
);


CREATE TABLE MEMBER
(
    member_id NUMBER(10) PRIMARY KEY,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    email VARCHAR2(255) UNIQUE NOT NULL
);


CREATE TABLE LIBRARIAN
(
    librarian_id NUMBER(10) PRIMARY KEY,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL
);


CREATE TABLE BOOK_AUTHOR
(
    book_id NUMBER(10),
    author_id NUMBER(10),
    author_order NUMBER(10),

    PRIMARY KEY (book_id, author_id),

    FOREIGN KEY (book_id)
    REFERENCES BOOK(book_id),

    FOREIGN KEY (author_id)
    REFERENCES AUTHOR(author_id)
);


CREATE TABLE LOAN
(
    loan_id NUMBER(10) PRIMARY KEY,
    book_id NUMBER(10) NOT NULL,
    member_id NUMBER(10) NOT NULL,
    librarian_id NUMBER(10) NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    returned_date DATE,

    FOREIGN KEY (book_id)
    REFERENCES BOOK(book_id),

    FOREIGN KEY (member_id)
    REFERENCES MEMBER(member_id),

    FOREIGN KEY (librarian_id)
    REFERENCES LIBRARIAN(librarian_id),

    CHECK (due_date >= loan_date)
);


INSERT INTO BOOK VALUES
(1, 'Harry Potter and the Philosophers Stone', '9780747532699', 1997);

INSERT INTO BOOK VALUES
(2, 'Harry Potter and the Chamber of Secrets', '9780747538493', 1998);

INSERT INTO BOOK VALUES
(3, 'Harry Potter and the Prisoner of Azkaban', '9780747542155', 1999);

INSERT INTO BOOK VALUES
(4, 'Harry Potter and the Goblet of Fire', '9780747546245', 2000);

INSERT INTO BOOK VALUES
(5, 'Harry Potter and the Order of the Phoenix', '9780747551003', 2003);

INSERT INTO BOOK VALUES
(6, 'Harry Potter and the Half-Blood Prince', '9780747581086', 2005);

INSERT INTO BOOK VALUES
(7, 'Harry Potter and the Deathly Hallows', '9780747591054', 2007);

INSERT INTO BOOK VALUES
(8, 'The Tales of Beedle the Bard', '9781408883099', 2018);

COMMIT;

SELECT * FROM BOOK
ORDER BY book_id;





INSERT INTO AUTHOR VALUES
(1, 'Joanne', 'Rowling');

INSERT INTO AUTHOR VALUES
(2, 'John Ronal Reuel', 'Tolkien');

INSERT INTO AUTHOR VALUES
(3, 'Rick', 'Riordan');

INSERT INTO AUTHOR VALUES
(4, 'Suzanne', 'Collins');

INSERT INTO AUTHOR VALUES
(5, 'George R. R.', 'Martin');

INSERT INTO AUTHOR VALUES
(6, 'Chris', 'Riddell');

COMMIT;

SELECT * FROM AUTHOR
ORDER BY author_id;

INSERT INTO MEMBER VALUES
(1, 'Harry', 'Potter', 'harry.potter@gryffindor.com');

INSERT INTO MEMBER VALUES
(2, 'Hermione', 'Granger', 'hermione.granger@gryffindor.com');

INSERT INTO MEMBER VALUES
(3, 'Ron', 'Weasley', 'ron.weasley@gryffindor.com');

INSERT INTO MEMBER VALUES
(4, 'Draconia', 'Malfoid', 'draconia.malfoid@slytherin.com');

INSERT INTO MEMBER VALUES
(5, 'Luna', 'Lovegood', 'luna.lovegood@ravenclaw.com');

COMMIT;

SELECT * FROM MEMBER
ORDER BY member_id;





INSERT INTO LIBRARIAN VALUES
(1, 'Minerva', 'McGonagall');

INSERT INTO LIBRARIAN VALUES
(2, 'Severus', 'Snape');

INSERT INTO LIBRARIAN VALUES
(3, 'Albus', 'Dumbledore');

INSERT INTO LIBRARIAN VALUES
(4, 'Filius', 'Flitwick');

INSERT INTO LIBRARIAN VALUES
(5, 'Poppy', 'Pomfrey');

COMMIT;

SELECT * FROM LIBRARIAN
ORDER BY librarian_id;





INSERT INTO BOOK_AUTHOR VALUES (1, 1, 1);

INSERT INTO BOOK_AUTHOR VALUES (2, 1, 1);

INSERT INTO BOOK_AUTHOR VALUES (3, 1, 1);

INSERT INTO BOOK_AUTHOR VALUES (4, 1, 1);

INSERT INTO BOOK_AUTHOR VALUES (5, 1, 1);

INSERT INTO BOOK_AUTHOR VALUES (6, 1, 1);

INSERT INTO BOOK_AUTHOR VALUES (7, 1, 1);

INSERT INTO BOOK_AUTHOR VALUES (8, 1, 1);

INSERT INTO BOOK_AUTHOR VALUES (8, 6, 2);

COMMIT;

SELECT * FROM BOOK_AUTHOR
ORDER BY book_id;





INSERT INTO LOAN VALUES
(1, 1, 1, 1, DATE '2026-10-01',
 DATE '2026-10-15', DATE '2026-10-12');

INSERT INTO LOAN VALUES
(2, 2, 2, 2, DATE '2026-10-03',
 DATE '2026-10-17', DATE '2026-10-16');

INSERT INTO LOAN VALUES
(3, 3, 3, 3, DATE '2026-10-05',
 DATE '2026-10-19', NULL);

INSERT INTO LOAN VALUES
(4, 4, 4, 4, DATE '2026-10-08',
 DATE '2026-10-22', NULL);

INSERT INTO LOAN VALUES
(5, 5, 5, 5, DATE '2026-10-10',
 DATE '2026-10-24', NULL);

COMMIT;

SELECT * FROM LOAN
ORDER BY loan_id;











GRANT SELECT ON BOOK TO patras2;

GRANT SELECT ON AUTHOR TO patras2;

GRANT SELECT ON MEMBER TO patras2;

GRANT SELECT ON LIBRARIAN TO patras2;

GRANT SELECT ON BOOK_AUTHOR TO patras2;

GRANT SELECT ON LOAN TO patras2;

-- THESE DONT WORK?! --
DESCRIBE BOOK;
DESCRIBE AUTHOR;
DESCRIBE MEMBER;
DESCRIBE LIBRARIAN;
DESCRIBE BOOK_AUTHOR;
DESCRIBE LOAN;

DESC BOOK;
DESC AUTHOR;
DESC MEMBER;
DESC LIBRARIAN;
DESC BOOK_AUTHOR;
DESC LOAN;
-- ??? ---


-- DESC Solution -- 
SELECT table_name,
       column_name,
       data_type,
       data_length,
       data_precision,
       nullable
FROM user_tab_columns
WHERE table_name IN
('BOOK', 'AUTHOR', 'MEMBER',
 'LIBRARIAN', 'BOOK_AUTHOR', 'LOAN')
ORDER BY table_name, column_id;


