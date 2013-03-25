# Grocer::ErrorCallback

Provide error callbacks from within Grocer

## Installation

Add this line to your application's Gemfile:

    gem 'grocer-error_callback'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grocer-error_callback

## Usage

```ruby

Grocer.on_connection_error do |exception|
  # Do stuff
end

```

The specified callback (of which there can be many), gets called every time
there is an exception raised during the `Grocer::Connection#with_connection`
block, which includes all sorts of things.

The most notably (and what I needed) is it gets called when there's an error
that occurs from Apple disconnecting the socket.  Even when the notification
is handled properly (IE: pusher auto-reconnects to the socket), the callback
will get called.

I'm using it to push stats into StatsD to see how often this occurs for us,
and to decide if I need to handle that specially.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
