## Index

1. [Install](#install)
    1. [APT repository](#apt-repository)
    2. [Manual installation](#manual-installation)

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

<link rel="stylesheet" href="./../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>