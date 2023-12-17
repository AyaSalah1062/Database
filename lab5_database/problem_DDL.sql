-- DDL scripts for database creation 

-- BOOK table
CREATE TABLE BOOK (
    book_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
    title VARCHAR(150) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    pub_id INT NOT NULL,
    category_id INT NOT NULL
);

-- CATEGORY table
CREATE TABLE CATEGORY (
    category_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(150) NOT NULL
);

-- PUBLISHER table
CREATE TABLE PUBLISHER (
    pub_id INT PRIMARY KEY,
    name VARCHAR(150),
    address VARCHAR(200)
);

-- MEMBER table
CREATE TABLE MEMBER (
    member_id INT PRIMARY KEY NOT NULL,
    name VARCHAR(150) NOT NULL,
    address VARCHAR(200) NOT NULL,
    join_date datetime NOT NULL
);

-- BORROWING_BOOK table
CREATE TABLE BORROWING_BOOK (
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date datetime NOT NULL,
    due_date datetime NOT NULL,
    return_date datetime NOT NULL,
    PRIMARY KEY (member_id, book_id, borrow_date)
);

-- Adding foreign key constraints to BOOK table
ALTER TABLE BOOK
ADD CONSTRAINT FK_BOOK_ID
FOREIGN KEY (book_id) REFERENCES borrowing_book(book_id);

ALTER TABLE BOOK
ADD CONSTRAINT FK_BOOK_PUB
FOREIGN KEY (pub_id) REFERENCES publisher(pub_id);

ALTER TABLE BOOK
ADD CONSTRAINT FK_BOOK_CATEGORY
FOREIGN KEY (category_id) REFERENCES category(category_id);
 

ALTER TABLE BORROWING_BOOK
ADD CONSTRAINT FK_MEMBER
FOREIGN KEY (member_id) REFERENCES member(member_id);