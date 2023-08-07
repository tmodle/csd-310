CREATE database whatabook;

show databases;

USE whatabook;

DROP USER IF EXISTS 'whatabook_user'@'localhost';

CREATE USER 'whatabook_user'@'localhost' identified with mysql_native_password by 'MySQL8isGreat!';

GRANT all privileges on whatabook.* to 'whatabook_user'@'localhost'



-- drop contstraints if they exist
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

-- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

/*
    Create table(s)
*/
CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

SHOW tables;



/*
    insert store record 
*/
INSERT INTO store(locale)
    VALUES('1234 Main St, Houston, TX 77338');

/*
    insert book records 
*/
INSERT INTO book(book_name, author, details)
    VALUES('Harry Potter and the Sorcerers Stone, 'J.K Rowling', 'The first book');

INSERT INTO book(book_name, author, details)
    VALUES('Harry Potter and the Chamber of Secrets', 'J.K. Rowling', 'The second book');

INSERT INTO book(book_name, author, details)
    VALUES('Harry Potter and the Prisoner of Azkaban, 'J.K Rowling', 'The third book');

INSERT INTO book(book_name, author, details)
    VALUES('Harry Potter and the Goblet of Fire', 'J.K. Rowling', 'The fourth book');

INSERT INTO book(book_name, author, details)
    VALUES('Harry Potter and the Order of the Phoenix, 'J.K Rowling', 'The fifth book');

INSERT INTO book(book_name, author, details)
    VALUES('Harry Potter and the Half Blood Prince', 'J.K. Rowling', 'The sixth book');

INSERT INTO book(book_name, author, details)
    VALUES('Harry Potter and the Deathly Hallows, 'J.K Rowling', 'The seventh book');

INSERT INTO book(book_name, author, details)
    VALUES('Harry Potter and the Cursed Child', 'J.K. Rowling', 'The eighth book');

INSERT INTO book(book_name, author, details)
    VALUES('Think and Grow Rich', 'Napoleon Hill', 'Personal Development');




/*
    insert user
*/ 
INSERT INTO user(first_name, last_name) 
    VALUES('Rosa', 'Tran');

INSERT INTO user(first_name, last_name)
    VALUES('Jennifer', 'Harris');

INSERT INTO user(first_name, last_name)
    VALUES('Courtney', 'Ashorn');

/*
    insert wishlist records 
*/
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Rosa'), 
        (SELECT book_id FROM book WHERE book_name = 'Think and Grow Rich')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Jennifer'),
        (SELECT book_id FROM book WHERE book_name = 'Harry Potter and the Cursed Child')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Courtney'),
        (SELECT book_id FROM book WHERE book_name = 'Harry Potter and the Sorcerers Stone')
    );