# URLParser

<table>
  <tr>
    <td>Build Status</td>
    <td>
      <a href="https://travis-ci.org/rails-api/active_model_serializers"><img src="https://travis-ci.org/rails-api/active_model_serializers.svg?branch=master" alt="Build Status" ></a>
      <a href="https://ci.appveyor.com/project/joaomdmoura/active-model-serializers/branch/master"><img src="https://ci.appveyor.com/api/projects/status/x6xdjydutm54gvyt/branch/master?svg=true" alt="Build status"></a>
    </td>
  </tr>
  <tr>
    <td>Code Quality</td>
    <td>
      <a href="https://codeclimate.com/github/rails-api/active_model_serializers"><img src="https://codeclimate.com/github/rails-api/active_model_serializers/badges/gpa.svg" alt="Code Quality"></a>
      <a href="https://codebeat.co/projects/github-com-rails-api-active_model_serializers"><img src="https://codebeat.co/badges/a9ab35fa-8b5a-4680-9d4e-a81f9a55ebcd" alt="codebeat" ></a>
      <a href="https://codeclimate.com/github/rails-api/active_model_serializers/coverage"><img src="https://codeclimate.com/github/rails-api/active_model_serializers/badges/coverage.svg" alt="Test Coverage"></a>
    </td>
  </tr>
  <tr>
    <td>Issue Stats</td>
    <td>
      <a href="https://github.com/rails-api/active_model_serializers/pulse/monthly">Pulse</a>
    </td>
  </tr>
</table>

## About

This Application brings convention over configuration to JSON generation.

It basically parse any url provided to its api and fetch the page content for tags 'h1', 'h2', 'h3' and links

It is generally safe and recommended to use the master branch.

## Install

### Download

You can download the latest
UrlParser [stable release (8.3.1)](https://github.com/publify/publify/archive/v8.3.1.tar.gz)

If you want to run the master branch, you can [clone the UrlParser
repository](https://github.com/publify/publify.git). However, random things may
be broken there at any time, so tread carefully!

### Install UrlParser locally

To install UrlParser you need the following:

- Ruby (MRI) 2.3.0
- Ruby on Rails 4.2.x
- A database engine, PgSQL

1.  Edit database.yml to add your database name, login and password.

```bash
$ bundle install
$ rake db:setup
$ rake db:migrate
$ rails server
```

You can now launch you browser and access 127.0.0.1:3000.
