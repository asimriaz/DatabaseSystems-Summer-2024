# PostgreSQL Primary Key
## Introduction to PostgreSQL primary key
A primary key is a column or a group of columns used to uniquely identify a row in a table. The column that participates in the primary key is known as the primary key column.

A table can have zero or one primary key. It cannot have more than one primary key.

It is a good practice to add a primary key to every table. When you add a primary key to a table, PostgreSQL creates a unique B-tree index on the column or a group of columns used to define the primary key.

Technically, a primary key constraint is the combination of a [not-null](#foo) constraint and a [UNIQUE](#foo) constraint.

Typically, you define primary for a table when creating it:
```sql
CREATE TABLE table_name (
  column_1 data_type PRIMARY KEY, 
  column_2 data_type,
  …
);
```
In this syntax, you define the primary key as the column constraint of the primary key column.

If the primary key consists of more than one column, you can define it using the table constraint:
```sql
CREATE TABLE table_name (
  column_1 data_type, 
  column_2 data_type,
  column_3 data_type,
  …
  PRIMARY KEY(column_1, column2, ...)
);
```
To add a primary key to an existing table, you the `ALTER TABLE ... ADD PRIMARY KEY` statement:
```sql
ALTER TABLE table_name 
ADD PRIMARY KEY (column_1, 
column_2, ...);
```
If you don’t explicitly specify the name for the primary key constraint, PostgreSQL will assign a default name to the primary key constraint.

By default, PostgreSQL uses the format `table-name_pkey` as the default name for the primary key constraint.

To assign a name for the primary key, you can use the `CONSTRAINT` clause as follows:
```sql
CONSTRAINT constraint_name 
PRIMARY KEY(column_1, column_2,...);
```
### PostgreSQL primary key examples
Let’s explore some examples of using the PostgreSQL primary key.

### 1) Creating a table with a primary key that consists of one column
The following statement creates a table with a primary key that consists of one column:
```sql
CREATE TABLE orders(
  order_id SERIAL PRIMARY KEY, 
  customer_id VARCHAR(255) NOT NULL, 
  order_date DATE NOT NULL
);
```
In this example, we create the orders with the order_id as the primary key.

We define the order_id column with the type SERIAL so that PostgreSQL will generate a unique integer (1, 2, 3, and so on) when you insert a new row into the table without providing the value for the order_id column.

This ensures the value in the order_id is unique for every row in the table.

### 2) Creating a table with a primary key that consists of two columns
The following example shows how to define a primary key that consists of two columns `order_id` and `item_no:`
```sql
CREATE TABLE order_items(
  order_id INT, 
  item_no SERIAL, 
  item_description VARCHAR NOT NULL, 
  quantity INTEGER NOT NULL, 
  price DEC(10, 2), 
  PRIMARY KEY (order_id, item_no)
);
```

### 3) Adding a primary key to an existing table
First, create a table called `products` without defining any primary key.
```sql
CREATE TABLE products (
  product_id INT, 
  name VARCHAR(255) NOT NULL,
  description TEXT, 
  price DEC(10, 2) NOT NULL
);
```

Second, add a primary key constraint to the `products` table using the `ALTER TABLE ... ADD PRIMARY KEY` statement:

```sql
ALTER TABLE products 
ADD PRIMARY KEY (product_id);
```

### 4) Adding an auto-incremented primary key to an existing table
First, create a new table called vendors that does not have a primary key:

```sql
CREATE TABLE vendors (
  name VARCHAR(255)
);
```

Second, insert some rows into the vendors table:
```sql
INSERT INTO vendors (name) 
VALUES 
  ('Microsoft'), 
  ('IBM'), 
  ('Apple'), 
  ('Samsung');
```
Output:

```sh  
   name
-----------
 Microsoft
 IBM
 Apple
 Samsung
(4 rows)
```
Third, add a primary key named `vendor_id` into the `vendors` table with the type `SERIAL`:

```sql
ALTER TABLE vendors 
ADD COLUMN vendor_id SERIAL PRIMARY KEY;
```
Finally, verify the vendor_id column:

```sql
SELECT 
  vendor_id, 
  name 
FROM 
  vendors;

```  
Output:
```sh
 vendor_id |   name
-----------+-----------
         1 | Microsoft
         2 | IBM
         3 | Apple
         4 | Samsung
(4 rows)
```
### Drop a primary key
To remove a primary key from a table, you use the following `ALTER TABLE` statement:
```sql
ALTER TABLE table_name 
DROP CONSTRAINT primary_key_constraint;
```
In this syntax:

 - First, specify the name of the table from which you want to remove the primary key.
 - Second, provide the primary key constraint to drop.
Let’s take an example of removing the primary key constraint from the vendors table using psql.

First, display the structure of the `vendors` table using the \d command:
```sh
\d vendors
```
Output:
```sh
                                         Table "public.vendors"
  Column   |          Type          | Collation | Nullable |                  Default
-----------+------------------------+-----------+----------+--------------------------------------------
 name      | character varying(255) |           |          |
 vendor_id | integer                |           | not null | nextval('vendors_vendor_id_seq'::regclass)
Indexes:
    "vendors_pkey" PRIMARY KEY, btree (vendor_id)
```

The output indicates that the primary key constraint is vendors_pkey.

Second, drop the primary key from the `vendors` table using the `ALTER TABLE ... DROP CONSTRAINT`    statement:
```sql
ALTER TABLE vendors
DROP CONSTRAINT vendors_pkey;
```
Output:
```sql
ALTER TABLE
```
The statement removes only the primary key constraint but does not remove the vendor_id column:
```sql
SELECT vendor_id, name 
FROM vendors;
```
Output:
```sh
 vendor_id |   name
-----------+-----------
         1 | Microsoft
         2 | IBM
         3 | Apple
         4 | Samsung
(4 rows)
```
### Summary
 - Use the `PRIMARY KEY` constraint to define a primary key for a table when creating the table.
 - Use the `ALTER TABLE ... ADD PRIMARY KEY` statement to add a primary key to a table.
 - Use the `ALTER TABLE ... DROP CONSTRAINT` statement to drop a primary key from a table.

---

 ## Introduction to PostgreSQL Foreign Key Constraint
In PostgreSQL, a foreign key is a column or a group of columns in a table that uniquely identifies a row in __another table.__

A foreign key establishes a link between the data in two tables by referencing the [primary key]() or a [unique]() constraint of the referenced table.

The table containing a foreign key is referred to as the referencing table or child table. Conversely, the table referenced by a foreign key is known as the referenced table or parent table.

The main purpose of foreign keys is to maintain referential integrity in a relational database, ensuring that relationships between the parent and child tables are valid.

For example, a foreign key prevents the insertion of values that do not have corresponding values in the referenced table.

Additionally, a foreign key maintains consistency by automatically updating or deleting related rows in the child table when changes occur in the parent table.

A table can have multiple foreign keys depending on its relationships with other tables.

To define a foreign key, you can use a foreign key constraint.

### PostgreSQL foreign key constraint syntax
The following illustrates a foreign key constraint syntax:
```sql
[CONSTRAINT fk_name]
   FOREIGN KEY(fk_columns) 
   REFERENCES parent_table(parent_key_columns)
   [ON DELETE delete_action]
   [ON UPDATE update_action]
```

In this syntax:

 - First, specify the name for the foreign key constraint after the `CONSTRAINT` keyword. The `CONSTRAINT` clause is optional. If you omit it, PostgreSQL will assign an auto-generated name.
- Second, specify one or more foreign key columns in parentheses after the `FOREIGN KEY` keywords.
- Third, specify the parent table and parent key columns referenced by the foreign key columns in the `REFERENCES` clause.
- Finally, specify the desired delete and update actions in the `ON DELETE` and `ON UPDATE` clauses.
The delete and update actions determine the behaviors when the primary key in the parent table is deleted and updated.

Since the primary key is rarely updated, the `ON UPDATE` action is infrequently used in practice. We’ll focus on the `ON DELETE` action.

PostgreSQL supports the following actions:

- SET NULL
- SET DEFAULT
- RESTRICT
- NO ACTION
- CASCADE
### PostgreSQL foreign key constraint examples
The following statements create the `customers` and `contacts` tables:

```sql
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS contacts;

CREATE TABLE customers(
   customer_id INT GENERATED ALWAYS AS IDENTITY,
   customer_name VARCHAR(255) NOT NULL,
   PRIMARY KEY(customer_id)
);

CREATE TABLE contacts(
   contact_id INT GENERATED ALWAYS AS IDENTITY,
   customer_id INT,
   contact_name VARCHAR(255) NOT NULL,
   phone VARCHAR(15),
   email VARCHAR(100),
   PRIMARY KEY(contact_id),
   CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
        REFERENCES customers(customer_id)
);
```

In this example, the `customers` table is the parent table and the `contacts` table is the child table.

Each customer has zero or many contacts and each contact belongs to zero or one customer.

The `customer_id` column in the `contacts` table is the foreign key column that references the primary key column with the same name in the `customers` table.

The following foreign key constraint `fk_customer` in the `contacts` table defines the `customer_id` as the foreign key:


```sql
CONSTRAINT fk_customer
   FOREIGN KEY(customer_id) 
      REFERENCES customers(customer_id)
```

Because the foreign key constraint does not have the `ON DELETE` and `ON UPDATE` action, they default to `NO ACTION`.

### NO ACTION
The following inserts data into the `customers` and `contacts` tables:

```sql
INSERT INTO customers(customer_name)
VALUES('BlueBird Inc'),
      ('Dolphin LLC');	   
	   
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');
```

The following statement deletes the customer id 1 from the `customers` table:
```sql
DELETE FROM customers
WHERE customer_id = 1;
```

Because of the `ON DELETE NO ACTION`, PostgreSQL issues a constraint violation because the referencing rows of the customer id 1 still exist in the `contacts` table:
```sh
ERROR:  update or delete on table "customers" violates foreign key constraint "fk_customer" on table "contacts"
DETAIL:  Key (customer_id)=(1) is still referenced from table "contacts".
SQL state: 23503
```

The `RESTRICT` action is similar to the `NO ACTION.` The difference only arises when you define the foreign key constraint as `DEFERRABLE` with an  `INITIALLY DEFERRED` or `INITIALLY IMMEDIATE` mode. We’ll discuss more on this in the upcoming tutorial.

### SET NULL
The `SET NULL` automatically sets `NULL` to the foreign key columns in the referencing rows of the child table when the referenced rows in the parent table are deleted.

First, drop the sample tables and re-create them with the foreign key that uses the `SET NULL` action in the `ON DELETE` clause:
```sql
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
   customer_id INT GENERATED ALWAYS AS IDENTITY,
   customer_name VARCHAR(255) NOT NULL,
   PRIMARY KEY(customer_id)
);

CREATE TABLE contacts(
   contact_id INT GENERATED ALWAYS AS IDENTITY,
   customer_id INT,
   contact_name VARCHAR(255) NOT NULL,
   phone VARCHAR(15),
   email VARCHAR(100),
   PRIMARY KEY(contact_id),
   CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
	  REFERENCES customers(customer_id)
	  ON DELETE SET NULL
);
```

Second, insert data into the customers and contacts tables:
```sql
INSERT INTO customers(customer_name)
VALUES('BlueBird Inc'),
      ('Dolphin LLC');	   
	   
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');
```

Third, delete the customer with id 1 from the `customers` table:
```sql 
DELETE FROM customers
WHERE customer_id = 1;
```

Because of the `ON DELETE SET NULL` action, the referencing rows in the contacts table are set to NULL.

Finally, display the data in the `contacts` table:
```sql
SELECT * FROM contacts;
```
Output:
```sh
 contact_id | customer_id | contact_name |     phone      |          email
------------+-------------+--------------+----------------+--------------------------
          3 |           2 | David Wright | (408)-222-1234 | david.wright@dolphin.dev
          1 |        null | John Doe     | (408)-111-1234 | john.doe@bluebird.dev
          2 |        null | Jane Doe     | (408)-111-1235 | jane.doe@bluebird.dev
(3 rows)
```

The output indicates that the values of customer id 1 changed to `NULL`.

### CASCADE
The `ON DELETE CASCADE` automatically deletes all the referencing rows in the child table when the referenced rows in the parent table are deleted. In practice, the `ON DELETE CASCADE` is the most commonly used option.

The following statements recreate the sample tables with the delete action of the `fk_customer` changes to `CASCADE`:
```sql
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
   customer_id INT GENERATED ALWAYS AS IDENTITY,
   customer_name VARCHAR(255) NOT NULL,
   PRIMARY KEY(customer_id)
);

CREATE TABLE contacts(
   contact_id INT GENERATED ALWAYS AS IDENTITY,
   customer_id INT,
   contact_name VARCHAR(255) NOT NULL,
   phone VARCHAR(15),
   email VARCHAR(100),
   PRIMARY KEY(contact_id),
   CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
	  REFERENCES customers(customer_id)
	  ON DELETE CASCADE
);

INSERT INTO customers(customer_name)
VALUES('BlueBird Inc'),
      ('Dolphin LLC');	   
	   
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');
```
The following statement deletes the customer id 1:
```sql
DELETE FROM customers
WHERE customer_id = 1;
```
Because of the `ON DELETE CASCADE` action, all the referencing rows in the `contacts` table are automatically deleted:
```sql
SELECT * FROM contacts;
```
Output:
```sh
 contact_id | customer_id | contact_name |     phone      |          email
------------+-------------+--------------+----------------+--------------------------
          3 |           2 | David Wright | (408)-222-1234 | david.wright@dolphin.dev
(1 row)
```
### SET DEFAULT

The `ON DELETE SET DEFAULT` sets the default value to the foreign key column of the referencing rows in the child table when the referenced rows from the parent table are deleted.

### Add a foreign key constraint to an existing table
To add a foreign key constraint to the existing table, you use the following form of the `ALTER TABLE` statement:
```sql
ALTER TABLE child_table 
ADD CONSTRAINT constraint_name 
FOREIGN KEY (fk_columns) 
REFERENCES parent_table (parent_key_columns);
```

When adding a foreign key constraint with `ON DELETE CASCADE` option to an existing table, you need to follow these steps:

First, drop existing foreign key constraint:
```sql
ALTER TABLE child_table
DROP CONSTRAINT constraint_fkey;
```

Second, add a new foreign key constraint with  `ON DELETE CASCADE` action:
```sql
ALTER TABLE child_table
ADD CONSTRAINT constraint_fk
FOREIGN KEY (fk_columns)
REFERENCES parent_table(parent_key_columns)
ON DELETE CASCADE;
```

### Summary
- Use foreign keys to ensure the referential integrity and consistency of data between two tables.
- Use the `FOREIGN KEY` constraint to define a foreign key constraint when creating a table.
- Use the `ALTER TABLE ... ADD CONSTRAINT ... FOREIGN KEY` to add a foreign key constraint to an existing table.
