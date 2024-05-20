# Basic SQL commands

SQL stands for Structured Query Language. SQL commands are the instructions used to communicate with a database to perform tasks, functions, and queries with data.

SQL commands can be used to search the database and to do other functions like creating tables, adding data to tables, modifying data, and dropping tables.

Here is a list of basic SQL commands (sometimes called clauses) you should know if you are going to work with SQL.

## SELECT and FROM

The SELECT part of a query determines which columns of the data to show in the results. There are also options you can apply to show data that is not a table column.

The example below shows three columns SELECTed FROM the “student” table and one calculated column. The database stores the studentID, FirstName, and LastName of the student. We can combine the First and the Last name columns to create the FullName calculated column.

```
SELECT ContactID, FirstName, LastName
FROM student;
```

<img src="/Users/segunadesokan/Desktop/client-server architecture mysql/acXP_contactsds.gif"></img>

## CREATE TABLE

CREATE TABLE does just what it sounds like: it creates a table in the database. You can specify the name of the table and the columns that should be in the table. The syntax is:

```
CREATE TABLE table_name (
    column_1 datatype,
    column_2 datatype,
    column_3 datatype
);
```

## INSERT

INSERT is a way to insert data into a table. The syntax is:

```
INSERT INTO table_name (column_1, column_2, column_3)
VALUES (value_1, 'value_2', value_3);
```

## DELETE

DELETE is used to delete a record in a table.

Be careful. You can delete all records of the table or just a few. Use the WHERE condition to specify which records you want to delete. The syntax is:

```
DELETE FROM table_name
WHERE condition;
```

## DROP

The DROP TABLE statement is used to drop an existing table in a database. The syntax is:

```
DROP TABLE table_name;
```

## SHOW

The SHOW command is used to display database information such as tables, databases, or the columns within a table. The sytax is:

```
SHOW DATABASES; #to show all databases
```

```
SHOW TABLES; #to show all tables in the current database:
```

```
SHOW COLUMNS FROM table_name; #to show columns in a specific table:
```

## Conclusion

The SHOW, CREATE, DROP, SELECT, and INSERT commands is essential for database management and manipulation. These basic SQL commands form the foundation for interacting with a relational database
