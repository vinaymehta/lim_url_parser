# LIM URL Parser

## About

This Application brings convention over configuration to JSON generation.

It basically parse any url provided to its api and fetch the page content for tags 'h1', 'h2', 'h3' and links

It is generally safe and recommended to use the master branch.

## Install

### Download

You can download the latest
LIM Url Parser [stable release](https://github.com/vinaymehta/lim_url_parser/archive/master.zip)

If you want to run the master branch, you can [clone the LIM Url Parser
repository](https://github.com/vinaymehta/lim_url_parser.git). However, random things may
be broken there at any time, so tread carefully!

### Install Application locally

To install LIM Url Parser you need the following:

- Ruby 2.3.0
- Ruby on Rails 4.2.x
- A database engine, PgSQL

1. Edit database.yml to add your database name, login and password.

```bash
$ bundle install
$ rake db:setup
$ rake db:migrate
$ rails server
```

You can now launch your browser and access 127.0.0.1:3000.
