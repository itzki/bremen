# Bremen [![Build Status](https://travis-ci.org/deeeki/bremen.png)](https://travis-ci.org/deeeki/bremen) [![Coverage Status](https://coveralls.io/repos/deeeki/bremen/badge.png)](https://coveralls.io/r/deeeki/bremen) [![Code Climate](https://codeclimate.com/github/deeeki/bremen.png)](https://codeclimate.com/github/deeeki/bremen) [![Gem Version](https://badge.fury.io/rb/bremen.png)](http://badge.fury.io/rb/bremen)

**Bremen** provides common search interface for some music websites. it supports YouTube, SoundCloud, MixCloud and Nicovideo

## Installation

Add this line to your application's Gemfile:

    gem 'bremen'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bremen

## Setting

As far as SoundCloud concerned, you need to set your app's client id before using.

```ruby
Bremen::Soundcloud.client_id = 'your_client_id'
```

Alternately, you can set 'SOUNDCLOUD_CLIENT_ID' environment variable.

## Usage

### Retrieving a single track

call `.find` method with uid(unique key) or url.

```ruby
Bremen::Youtube.find('XXXXXXXXXXX')
Bremen::Youtube.find('http://www.youtube.com/watch?v=XXXXXXXXXXX')
Bremen::Soundcloud.find('1111111')
Bremen::Soundcloud.find('http://soundcloud.com/author/title')
Bremen::Mixcloud.find('/author/title/')
Bremen::Mixcloud.find('http://www.mixcloud.com/author/title/')
Bremen::Nicovideo.find('sm1111111')
Bremen::Nicovideo.find('http://www.nicovideo.jp/watch/sm1111111')
```

### Retrieving multiple tracks

call `.search` method with keyword.

```ruby
Bremen::Youtube.search(keyword: 'Perfume')
```

#### Optional params

You can add optional parameters for filtering. But it doesn't support all official API's filters.

```ruby
Bremen::Youtube.search(keyword: 'KyaryPamyuPamyu', order: 'relevance', limit: 10)
```

### Track object

Retrieving methods return Track object(s).

attribute    |type         |description               |
-------------|-------------|--------------------------|
uid          |String       |unique key for each site  |
url          |String       |                          |
title        |String       |                          |
author       |Author Object|uid/url/name/thumbnail_url|
length       |Integer      |duration of track         |
thumbnail_url|String       |thumbnail image           |
created_at   |Time         |released datetime         |
updated_at   |Time         |modified datetime         |

## API references

- [Reference Guide: Data API Protocol - YouTube — Google Developers](https://developers.google.com/youtube/2.0/reference#Searching_for_videos)
- [Docs - API - Reference - SoundCloud Developers](http://developers.soundcloud.com/docs/api/reference#tracks)
- [API documentation | Mixcloud](http://www.mixcloud.com/developers/documentation/#search)

## Supported versions

- Ruby 1.9.3 or higher

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
