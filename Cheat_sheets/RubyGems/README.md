# RubyGems

## Index

1. [Introduction](#introduction)
2. [Getting started](#getting-started)
3. [Dev commands](#dev-commands)
4. [Gem credentials](#gem-credentials)
5. [Publish your new gem](#publish-your-new-gem)
6. [Update your published gem](#update-your-published-gem)
7. [Install your published gem](#install-your-published-gem)
8. [Gem repository example](#gem-repository-example)
9. [Additional information](#additional-information)

## Introduction

To publish and install gems from the public RubyGems registry you must install Ruby and Gem using the apt of Linux Debian.

```shell
sudo apt install ruby
```

To see if you already have Ruby and Gem installed and check the installed version, run the following commands:

```shell
ruby -v
gem -v
```

Check out the [RubyGems Guides](https://guides.rubygems.org/) for more information.

## Getting started

The structure of a basic RubyGems project looks like this:

```
your_gem/
├── bin/
│   └── your_gem
├── build/
│   ├── your_gem-0.1.0.gem
│   ├── your_gem-0.1.1.gem
│   └── your_gem-1.0.0.gem
├── lib/
│   └── .../
│       └── *.rb
├── test/
│   └── test_your_gem.rb
├── LICENSE
├── Rakefile
├── README.md
└── your_gem.gemspec
```

## Dev commands

```shell
# Run the slugify executable locally using the lib folder
ruby -Ilib bin/your_gem "Hello, World!"
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
:rubygems_api_key: TOKEN
:github: Bearer TOKEN
```

## Publish your new gem

```shell
gem build your_gem.gemspec
```

```shell
# RubyGems
gem signin
gem push your_gem-1.0.0.gem
```

```shell
# GitHub Packages
gem push --key github --host https://rubygems.pkg.github.com/NAMESPACE your_gem-1.0.0.gem
```

## Update your published gem

Once the gem code has been updated, the version number located in the "your_gem.gemspec" file is changed to a higher number and then the build and push commands are executed as mentioned before.

## Install your published gem

```shell
gem install your_gem
gem list | grep your_gem
```

## Gem repository example

I have created a repository and published a very simple gem that will serve as a reference for creating your first gems.

Contribute to the repository on [GitHub](https://github.com/FJrodafo/Slugify).

Check out this gem on [GitHub Packages](https://github.com/FJrodafo/Slugify/pkgs/rubygems/your_gem) or [RubyGems](https://rubygems.org/gems/your_gem) website!

## Additional information

This cheat sheet is available on GitHub Gist at https://gist.github.com/FJrodafo/53f0abf61249ecfc561c570a01ce1090

Explore more gists by Francisco José Rodríguez Afonso at https://gist.github.com/FJrodafo