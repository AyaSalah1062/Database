--> Q1:SQL query to retrieve names of members who joined the system after September 1, 2000:
SELECT name
FROM member
WHERE join_date > '2000-09-01';

--> Q2:SQL query to retrieve all info of members who joined the system between October 1, 1995, and October 1, 2019:
SELECT *
FROM member
WHERE join_date BETWEEN '1995-10-01' AND '2019-10-01';

--> Q3:SQL query to retrieve all info of books with publisher name "Oxford" or the price between 15 and 20:
SELECT *
FROM book
JOIN publisher ON book.pub_id = publisher.pub_id
WHERE publisher.name = 'Oxford' OR (price >= 15 AND price <= 20);