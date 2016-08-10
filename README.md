# LIM URL Parser

## About

This Application brings convention over configuration to JSON generation.

It basically parses any url provided in api and fetch the page content for tags 'h1', 'h2', 'h3' and links and store them. It also shows all stored urls and their respective contents.

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

## Usage

### 1. Save Url Page Content Api

To save content of a page, you need to send request with url of page you want to parse. For example:

#### HTTP Request
`POST /api/save_content`

#### ARGUMENTS

Parameter | Type | Description
--------- | ---- | -----------
url | String | URL of page to be parsed (required)

> A sample request:

```json
{
  "url": "http://berylsystems.com"
}
```

> A sample response for successfully saved content with status 200

```json
{
  "data": {
    "url": "http://berylsystems.com",
    "h1": [
      "Why it should be us ?"
    ],
    "h2": [
      "Vision",
      "Mission",
      "Experts with us : Ownership",
      "It's +delta: innovative in approach",
      "Well the basics : OTQ delivery",
      "Engaged: Owl eyes Bat ears"
    ],
    "h3": [
      "About us",
      "Join us",
      "Get in touch"
    ],
    "links": [
      "https://www.facebook.com/pages/Beryl-Systems/168238099857751",
      "https://twitter.com/berylsystems",
      "https://www.linkedin.com/company/beryl-systems",
      "mailto:info@berylsystems.com"
    ]
  },
  "message": "Url Content Stored successfully.",
  "status": 200
}
```

> A sample response if no url provided with status 400

```json
{
  "error": "Please provide Url!",
  "status": 400
}
```

> A sample response if url is invalid

```json
{
  "message": "Something went wrong! Please try again later",
  "status": 404
}
```


### 2. Show all stored Urls Api

To show all stored urls and their contents. For example:

#### HTTP Request

`GET /api/show`

> A sample response status 200

```json
{
  "data": [
    {
      "url": "http://berylsystems.com/",
      "h1": [
        "Why it should be us ?"
      ],
      "h2": [
        "VisionMissionExperts with us : OwnershipIt's +delta: innovative in approachWell the basics : OTQ deliveryEngaged: Owl eyes Bat ears"
      ],
      "h3": [
        "About usJoin usGet in touch"
      ],
      "links": [
        "Services what we offer Portfolio our creations Start how to Blog Discussions Labs startup labs Testimonials client feedback Careers join us Contact get in touch Visit Open Positionsinfo@berylsystems.com"
      ]
    },
    {
      "url": "https://facebook.com",
      "h1": [
        "Facebook"
      ],
      "h2": [
        "आपके ब्राउज़र पर Javascript अक्षम है.",
        "सुरक्षा जाँच"
      ],
      "h3": [],
      "links": [
        "https://www.facebook.com/",
        "https://pa-in.facebook.com/",
        "https://ur-pk.facebook.com/",
        "https://gu-in.facebook.com/",
        "https://bn-in.facebook.com/",
        "https://ta-in.facebook.com/",
        "https://te-in.facebook.com/",
        "https://ml-in.facebook.com/",
        "https://kn-in.facebook.com/",
        "https://en-gb.facebook.com/",
        "https://es-la.facebook.com/"
      ]
    },
    {
      "url": "http://berylsystems.com",
      "h1": [
        "Why it should be us ?"
      ],
      "h2": [
        "Vision",
        "Mission",
        "Experts with us : Ownership",
        "It's +delta: innovative in approach",
        "Well the basics : OTQ delivery",
        "Engaged: Owl eyes Bat ears"
      ],
      "h3": [
        "About us",
        "Join us",
        "Get in touch"
      ],
      "links": [
        "https://www.facebook.com/pages/Beryl-Systems/168238099857751",
        "https://twitter.com/berylsystems",
        "https://www.linkedin.com/company/beryl-systems",
        "mailto:info@berylsystems.com"
      ]
    }
  ],
  "status": 200
}
```

## Rspecs

To run its test cases, please run this command

```bash
$ bundle exec rspec --format doc
```
