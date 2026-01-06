# npm

## Index

1. [Introduction](#introduction)
2. [Getting started](#getting-started)
3. [Publish your new package](#publish-your-new-package)
4. [My package name is already taken!](#my-package-name-is-already-taken)
5. [Update your published npm package](#update-your-published-npm-package)
6. [npm package repository example](#npm-package-repository-example)
7. [Additional information](#additional-information)

## Introduction

To publish and install packages to and from the public npm registry or a private npm registry, you must install Node.js and the npm command line interface using either a Node version manager or a Node installer.

I have a useful script that shows how to install nodejs and npm, you can check this script [here](https://github.com/FJrodafo/Dotfiles/blob/main/Scripts/Install_node_and_npm.sh) or you can check out the repository [here](https://github.com/FJrodafo/Dotfiles) instead of just the file.

To see if you already have Node.js and npm installed and check the installed version, run the following commands:

```shell
node -v
npm -v
```

Check out the [npm Docs](https://docs.npmjs.com/) for more information.

## Getting started

Initialize a new project (It will generate the `package.json` file in the root directory of your new project):

```shell
npm init
```

To test your new package project locally, type the following command (Make sure you are in the `Package` folder where the `package.json` file is located):

```shell
npm link
```

Then move to your test folder and type the following command to install your new package locally (It is important to type the package name correctly, the same name you entered when you initialized the `package.json` file):

```shell
npm link <package-name>
```

## Publish your new package

Before publishing the package, you have to log in to your npm account. If you don't have one, you can create one [here](https://www.npmjs.com/signup). Then you have to log in from your local terminal by typing the following command:

```shell
npm login
```

Finally you can publish your new package by typing the following command (Make sure you are in the `Package` folder where the `package.json` file is located):

```shell
npm publish
```

If everything went well, you can check that your package has been published by searching for it [here](https://www.npmjs.com/).

## My package name is already taken!

Don't worry, there is a method to publish your package with whatever name you want, you just need to add a prefix to it.

![Screenshot](https://raw.githubusercontent.com/FJrodafo/University/main/Cheat_sheets/npm/Assets/Screenshot.png)

As you can see in the screenshot above, I simply add my username to the package name from the `package.json` file. Then you can publish your new package even if the name is already taken. To publish it, type the following command (The `--access=public` option is required, otherwise npm will publish packages with prefixes as private packages by default. If we want to publish it as a public package, just type the following command):

```shell
npm publish --access=public
```

If you want to make your package scoped by default when you initialize it, just type the following command (It will create the prefix with your username automatically when initializing a new package):

```shell
npm init --scope=<npm-username>
```

## Update your published npm package

Change the version in your `package.json` by typing the following command (Make sure you are in the `Package` folder where the `package.json` file is located):

```shell
npm version <new-version>
```

Instead of doing it manually, there are some commands to change the version. First of all, you should know that there are three types of versions:

1. If it is an patch release (small changes) use following:

```shell
# It will increment the last part of version number (0.0.1).
npm version patch
```

2. If it is a minor release (new features) use following:

```shell
# It will increment the middle part of version number (0.1.0).
npm version minor
```

3. If it is a major release (major features or major issue fixes) use following:

```shell
# It will increment the first part of version number (1.0.0).
npm version major
```

Finally, once the changes are made, you can publish your new version of the package by typing the following command:

```shell
# If your package does not have a prefix
npm publish
# If your package has a prefix
npm publish --access=public
```

## npm package repository example

I have created a repository and published a very simple npm package that will serve as a reference for creating your first npm packages.

Contribute to the repository on [GitHub](https://github.com/FJrodafo/port-finder).

Check out this package on [GitHub Packages](https://github.com/FJrodafo/port-finder/pkgs/npm/port-finder) or [npmjs](https://www.npmjs.com/package/@fjrodafo/port-finder) website!

## Additional information

This cheat sheet is available on GitHub Gist at https://gist.github.com/FJrodafo/0b300abc47326cc74bb5dfac5202cf8a

Explore more gists by Francisco José Rodríguez Afonso at https://gist.github.com/FJrodafo

<link rel="stylesheet" href="./../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>