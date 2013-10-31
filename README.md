# Call of Duty

Simple gem for interfacing with Call of Duty servers. Starting with a simple query for COD4.

## Installation

Add this line to your application's Gemfile:

    gem 'call-of-duty'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install call-of-duty

## Usage

    cod4_server = CallOfDuty::Cod4Server.new("192.168.1.1")
    cod4_server.query_server
    cod4_server.mapname

## Development

    bundle
    bx rspec spec

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
