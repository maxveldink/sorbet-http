# Typed::HTTP

Common HTTP types for Sorbet-aware Ruby projects. Never write your own HTTP status code converter again!

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add sorbet-http

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install sorbet-http

## Usage

The provided types are in the `Typed::HTTP` module. Here's some example usage:

```ruby
Typed::HTTP::Method::Get.serialize # => "GET"
Typed::HTTP::Method.deserialize("POST") # => Typed::HTTP::Method::Post

Typed::HTTP::StatusCode::Ok.serialize # => "200 OK"
Typed::HTTP::StatusCode.deserialize("500 Internal Server Error") # => Typed::HTTP::StatusCode::InternalServerError

Typed::HTTP::StatusCode::Ok.to_i # => 200
Typed::HTTP::StatusCode::Ok.to_code # => 200

Typed::HTTP::StatusCode.from_i(200) # => Typed::HTTP::StatusCode::Ok
Typed::HTTP::StatusCode.from_code(200) # => Typed::HTTP::StatusCode::Ok

Typed::HTTP::StatusCode::OK.successful? # => true
Typed::HTTP::StatusCode::InternalServerError.successful? # => false

Typed::HTTP::StatusCode::Continue.informational? # => true
Typed::HTTP::StatusCode::Found.redirection? # => true
Typed::HTTP::StatusCode::BadRequest.client_error? # => true
Typed::HTTP::StatusCode::InternalServerError.server_error? # => true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run Rubocop and the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maxveldink/sorbet-http. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/maxveldink/sorbet-http/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in this project's codebase, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/maxveldink/sorbet-http/blob/master/CODE_OF_CONDUCT.md).

## Sponsorships

I love creating in the open. If you find this or any other [maxveld.ink](https://maxveld.ink) content useful, please consider sponsoring me on [GitHub](https://github.com/sponsors/maxveldink).
