# Database management system (DBMS) that exist and what each type is suitable for.

### What is Database?

A database is a collection of inter-related data which is used to retrieve, insert and delete the data efficiently. It is also used to organize the data in the form of a table, schema, views, and reports, etc.

### What is Database management system?

A database management system – abbreviated as DBMS – is a computerized solution that helps store information in a manner that is easy to read, edit, delete, and scale, with the primary objective of drawing correlations, powering analysis, and supporting data-driven workflows. It has a backend storage system as well as a front-end user interface.

### DBMS allows users the following tasks:

- Data Definition: It is used for creation, modification, and removal of definition that defines the organization of data in the database.
- Data Updation: It is used for the insertion, modification, and deletion of the actual data in the database.
- Data Retrieval: It is used to retrieve the data from the database which can be used by applications for various purposes.
- User Administration: It is used for registering and monitoring users, maintain data integrity, enforcing data security, dealing with concurrency control, monitoring performance and recovering information corrupted by unexpected failure.

### Types of Database management system

There are several types of databases. Below is a list of seven common types of Databases

- Hierarchical databases: In a hierarchical database model, data is organized into a tree-like structure. The data is stored in the form of a collection of fields where each field contains only one value. The records are linked to each other via links into a parent-children relationship. In a hierarchical database model, each child record has only one parent. A parent can have multiple children.

- Network databases: Network database management systems (Network DBMSs) use a network structure to create a relationship between entities. Network databases are mainly used on large digital computers. Network databases are hierarchical, but unlike hierarchical databases, where one node can have a single parent only, a network node can have a relationship with multiple entities. A network database looks more like a cobweb or interconnected network of records.
- Relational databases: In a relational database management system (RDBMS), the relationship between data is relational and stored in tabular form of columns and rows. Each table column represents an attribute, and each Row in a table represents a record. Each field in a table represents a data value.

  - Structured Query Language (SQL) is used to query RDBMS, including inserting, updating, deleting, and searching records. Relational databases work on each table with a key field that uniquely indicates each Row. These key fields can be used to connect one table of data to another.

- Object-oriented databases: The Object-Oriented Programming approach is analogical to the application and database development in a constant data model and language environment. Applications require less code, use more natural data modeling, and code bases are easier to maintain. Object developers can write complete database applications with a decent amount of additional effort.
- Graph databases: Graph Databases are NoSQL databases and use a graph structure for semantic queries. The data is stored as nodes, edges, and properties. In a graph database, a Node represents an entity or instance, such as a customer, person, or car. A node is equivalent to a record in a relational database system. An Edge in a graph database represents a relationship that connects nodes. Properties are additional information added to the nodes.
- ER model databases: An ER model is typically implemented as a database. In a simple relational database implementation, each table Row represents one instance of an entity type, and each field in a table represents an attribute type. In a relational database, a relationship between entities is implemented by storing the primary key of one entity as a pointer or "foreign key" in the table of another entity.
- Document databases: Document databases (Document DB) are also NoSQL databases that store data as documents. Each document represents the data, its relationship with other data elements, and its attributes of data. Document database store data in a key-value form.

- NoSQL databases: NoSQL databases do not use SQL as their primary data access language. A graph database, network database, object database, and document databases are common NoSQL databases. Here is an article on Introduction to NoSQL Databases. This article answers the question, what is a NoSQL database?

  - NoSQL database does not have predefined schemas, which makes NoSQL databases a perfect candidate for rapidly changing development environments.

  - NoSQL allows developers to make changes on the fly without affecting applications.

  - NoSQL databases can be categorized into the following five major categories: Column, Document, Graph, Key-value, and Object.

### What Is the Difference Between SQL and NoSQL?

Relational databases, like those of MySQL and PostgreSQL, store data by using an explicit schema. A schema describes how to write data in the database, particularly describing the structure, types, and structures of tables and records.

The terms 'SQL' and 'NoSQL' essentially refer to how these schemas are defined. In a relational database, users use the SELECT, INSERT and DELETE statements to add or update data. The corresponding SQL statement looks like this:

SELECT name FROM employees WHERE number < 100;

In a NoSQL database, users do not define a schema. Instead, they can store data using any structure they wish, with a relational SQL query providing data that users can then use to update that data. The two types of database systems also provide different ways of accessing the data. Where SQL can be expressed as rows (called field values) and tables (indexes), NoSQL queries allow you to access data as documents (columns) and view data through various perspectives.

By comparison, one of the main differences between relational databases and NoSQL systems is that while relational databases generally support minimal transactions, NoSQL systems allow transactions to run on any row and transaction records. While this sounds like a trivial difference, it is a big step forward in performance and scalability.

### Conclusion

The decision of which database system is best for you and your project depends on the nature of the data you have and the performance you need. The knowledge gained from this brief introduction will help in making the right choice.
