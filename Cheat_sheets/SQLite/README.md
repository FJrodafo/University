## Index

1. [Install](#install)
    1. [APT repository](#apt-repository)
    2. [Manual installation](#manual-installation)
2. [First steps](#first-steps)

## Install

### APT repository

Update the repositories to ensure you have the latest versions of the packages.

```shell
sudo apt update
```

Install SQLite with the following command.

```shell
sudo apt install sqlite3
```

Check the installation to make sure everything went well.

```shell
sqlite3 --version
```

### Manual installation

First, make sure you have the necessary tools to compile the code.

```shell
sudo apt update
sudo apt install build-essential tcl
```

Now, go to the [official SQLite site](https://www.sqlite.org/index.html) to download the latest version of the source code.

Copy the link to the latest version of the tarball file. For example, if you download the `sqlite-autoconf-xxxxxxx.tar.gz` file, you can use `wget` to get it directly from the terminal.

```shell
wget https://www.sqlite.org/2025/sqlite-autoconf-3490100.tar.gz
```

Once the file is downloaded, unzip/move it.

```shell
tar -xzvf sqlite-autoconf-3490100.tar.gz
mv sqlite-autoconf-3490100 ~/.sqlite
```

Enter the directory, configure and compile the source code.

```shell
cd ~/.sqlite
./configure
make
```

When the compilation completes without errors, you can install SQLite with the following command.

```shell
sudo make install
```

To ensure that SQLite is installed correctly, check the installed version.

```shell
sqlite3 --version
```

## First steps

Create a file called `example.sql` to start writing the database. Create a table with an example of each data type:

```sql
-- Create table "Examples"
CREATE TABLE Examples (
    id_eg INTEGER PRIMARY KEY,
    text_eg TEXT,
    integer_eg INTEGER,
    decimal_eg REAL,
    date_eg DATE,
    boolean_eg BOOLEAN
);
```

Insert some data:

```sql
INSERT INTO Ejemplos (texto, entero, decimal, fecha, booleano) 
VALUES 
('Hello, World!', 42, 3.14, '2025-03-22', 1),
('Another text...', 100, 2.718, '2024-12-31', 0);
```

Open SQLite and create the database. This will create and open the database `example.db`

```shell
sqlite3 example.db
```

Check the open database:

```shell
PRAGMA database_list;
```

Import the database:

```shell
.read /home/user/path/to/example.sql
```

To see all the tables you have in the current database, use:

```shell
.tables
```

If you want to see the structure (columns and data types) of a specific table, use:

```shell
.schema Examples
```

Changing Output Formats:

```shell
.mode markdown
.mode table
.mode box
```

Consult the inserted data:

```sql
SELECT * FROM Examples;
```

Exit SQLite

```shell
.exit
```

Open a terminal and use the following command to dump the database directly to a `.sql` file:

```shell
sqlite3 example.db .dump > example-dump.sql
```

<link rel="stylesheet" href="./../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>