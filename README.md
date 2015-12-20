# Aric

<a href="https://codeclimate.com/github/ganmacs/aric"><img src="https://codeclimate.com/github/ganmacs/aric/badges/gpa.svg" /></a>
[![Build Status](https://travis-ci.org/ganmacs/aric.svg)](https://travis-ci.org/ganmacs/aric)

Awesome Ruby Itunes Client

## Requirements

* OSX Yosemite or higher
* Ruby 2.2 or higher

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aric'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aric

## Usage

### Command Line

Show avalable jobs.

```shell
$ aric --list
```

Execute jobs as follow.

```shell
// play trakcs
$ aric play

// next tracks
$ aric next

// volume up by 10
$ aric up 10

// show tracks in current playlists
$ aric current_playlist_tracks

// set state to track love
$ aric love

// open iTunes
$ aric activate
```

Play founded tracks with `-p` option.

```shell
// play loved tracks
$ aric -p find_loved_tracks

// play found tracks

$ aric -p find_tracks <track_name>
```

### Use As Library

```rb
require 'aric/resource/track'

tracks = Track.find_by(name: 'Puppy Love')
track = tracks.first

puts track.name

track.play
track.stop

require 'aric/job/volume'
Volume.up 10
Volume.down 10
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/aric/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
