## Index

1. [How To Install MySQL on Ubuntu 22.04](#how-to-install-mysql-on-ubuntu-2204)
2. [Configuring MySQL](#configuring-mysql)
3. [User authentication and privileges](#user-authentication-and-privileges)
4. [Additional information](#additional-information)

## How To Install MySQL on Ubuntu 22.04

On Ubuntu 22.04, you can install MySQL using the APT package repository. At the time of this writing, the version of MySQL available in the default Ubuntu repository is version 8.0.36.

To install it, update the package index on your server if you’ve not done so recently:

```shell
sudo apt update
```

Then install the `mysql-server` package:

```shell
sudo apt install mysql-server
```

To check the version of MySQL that we have installed we will use the following command:

```shell
mysql --version
```

Ensure that the server is running using the `systemctl status` command:

```shell
sudo systemctl status mysql.service
```

If the server is not running, you can start the server with the `systemctl start` command:

```shell
sudo systemctl start mysql.service
```

You can reset the server with the `systemctl restart` command:

```shell
sudo systemctl restart mysql.service
```

Finally to stop the server you can use `systemctl stop` command:

```shell
sudo systemctl stop mysql.service
```

If you want to disable automatic startup of MySQL every time you start your operating system, run the following command:

```shell
sudo systemctl disable mysql.service
```

## Configuring MySQL

You will need to change your authentication method from `auth_socket` to `mysql_native_password` to use a password to connect to MySQL as **root**. To do this, open the MySQL prompt from your terminal:

```shell
sudo mysql
```

To query which authentication method each of your MySQL user accounts uses using the following command:

```shell
SELECT user,authentication_string,plugin,host FROM mysql.user;
```

Then run the following `ALTER USER` command to change the **root** user’s authentication method to one that uses a password. The following example changes the authentication method to `mysql_native_password`:

```shell
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_root_password';
```

Then run `FLUSH PRIVILEGES`, which tells the server to reload the grant tables and implement your new changes:

```shell
FLUSH PRIVILEGES;
```

After making this change, exit the MySQL prompt:

```shell
exit
```

Following that, you can run the `mysql_secure_installation` script without issue.

Run the security script with `sudo`:

```shell
sudo mysql_secure_installation
```

This will take you through a series of prompts where you can make some changes to your MySQL installation’s security options.

Once the security script completes, you can then reopen MySQL and change the **root** user’s authentication method back to the default, `auth_socket`. To authenticate as the **root** MySQL user using a password, run this command:

```shell
mysql -u root -p
```

Then, if you want, revert to the default authentication method using this command:

```shell
ALTER USER 'root'@'localhost' IDENTIFIED WITH auth_socket;
```

This will mean that you can once again connect to MySQL as your **root** user using the `sudo mysql` command.

## User authentication and privileges

Once you have access to the MySQL prompt (regardless of whether you access using `sudo mysql` or `mysql -u root -p`), you can create a new user with a `CREATE USER` statement. These follow this general syntax:

```shell
CREATE USER 'your_user_name'@'localhost' IDENTIFIED BY 'your_user_password';
```

Then, give your new user the appropriate privileges. For example, you can grant the user privileges to all tables within the database, as well as authority to add, change, and delete user privileges, using this command (Note that this statement also includes `WITH GRANT OPTION`. This will allow your MySQL user to grant any permissions that it has to other users on the system):

```shell
GRANT ALL PRIVILEGES ON *.* TO 'your_user_name'@'localhost' WITH GRANT OPTION;
```

Instead of using the asterisk, which refers to all databases or tables, you can specify the database or table for which you want the user to have permissions by using this command:

```shell
GRANT ALL PRIVILEGES ON your_database_name.your_table_name TO 'your_user_name'@'localhost' WITH GRANT OPTION;
```

This is an example of some privileges:

```shell
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, INDEX, DELETE, SELECT, REFERENCES, RELOAD on users.* TO 'fjrodafo'@'localhost' WITH GRANT OPTION;
```

## Additional information

This cheat sheet is available on GitHub Gist at https://gist.github.com/FJrodafo/613d8cff0c47e3346cd20c300c01b3c9

Explore more gists by Francisco José Rodríguez Afonso at https://gist.github.com/FJrodafo

<link rel="stylesheet" href="./../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>