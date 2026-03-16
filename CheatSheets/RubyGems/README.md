# RubyGems

## Index

1. [Introduction](#introduction)
2. [Getting started](#getting-started)
3. [Dev commands](#dev-commands)
4. [Gem credentials](#gem-credentials)
5. [Publish your new gem](#publish-your-new-gem)
    1. [RubyGems](#rubygems-1)
    2. [GitHub Packages](#github-packages)
6. [Update your published gem](#update-your-published-gem)
7. [Install your published gem](#install-your-published-gem)
8. [Gem repository example](#gem-repository-example)
9. [Additional information](#additional-information)

## Introduction

To publish and install gems from the public RubyGems registry you must install Ruby and Gem using the apt of Linux Debian.

```shell
sudo apt install ruby-full
```

To see if you already have Ruby and Gem installed and check the installed version, run the following commands:

```shell
ruby -v
gem -v
```

Check out the [Ruby](https://www.ruby-lang.org/en/documentation/installation/#apt) and [RubyGems](https://guides.rubygems.org/) websites for more information.

## Getting started

The structure of a basic RubyGems project looks like this:

```
Slugify/
├── bin/
│   └── fjrodafo-slugify
├── build/
│   └── fjrodafo-slugify-1.0.0.gem
├── lib/
│   └── fjrodafo/
│       ├── slugify
│       │   └── transliteration.rb
│       └── slugify.rb
├── test/
│   └── test_fjrodafo-slugify.rb
├── Rakefile
└── fjrodafo-slugify.gemspec
```

## Dev commands

```shell
# Run the slugify executable locally using the lib folder
ruby -Ilib bin/fjrodafo-slugify "Hello, World!"
```

```shell
# Run all tests using Rake
rake test
```

## Gem credentials

```shell
nano ~/.gem/credentials
```

```
---
:rubygems_api_key: rubygems_****
:github: Bearer ghp_****
```

## Publish your new gem

```shell
gem build fjrodafo-slugify.gemspec
```

### RubyGems

```shell
gem signin
gem push fjrodafo-slugify-1.0.0.gem
```

### GitHub Packages

```shell
gem push --key github --host https://rubygems.pkg.github.com/fjrodafo-slugify fjrodafo-slugify-1.0.0.gem
```

## Update your published gem

Once the gem code has been updated, the version number located in the "fjrodafo-slugify.gemspec" file is changed to a higher number and then the build and push commands are executed as mentioned before.

## Install your published gem

```shell
gem install fjrodafo-slugify
gem list | grep fjrodafo-slugify
```

## Gem repository example

I have created a repository and published a very simple gem that will serve as a reference for creating your first gems.

Contribute to the repository on [GitHub](https://github.com/FJrodafo/Slugify).

Check out this gem on [GitHub Packages](https://github.com/FJrodafo/Slugify/pkgs/rubygems/fjrodafo-slugify) or [RubyGems](https://rubygems.org/gems/fjrodafo-slugify) website!

## Additional information

This cheat sheet is available on GitHub Gist at https://gist.github.com/FJrodafo/53f0abf61249ecfc561c570a01ce1090

Explore more gists by Francisco José Rodríguez Afonso at https://gist.github.com/FJrodafo
