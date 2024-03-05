# Ruby URL Word Counter

This is a simple Ruby script that scrapes a given URL and prints out the top 25 most frequently used words on the page.

## Requirements

- Ruby (version specified in [.ruby-version](.ruby-version))
- Bundler

## Installation

1. Clone this repository.
2. Run `bundle install` to install the required gems.

## Usage

Run the script with a URL as an argument:

```sh
ruby main.rb 'hthttps://www.ruby-lang.org/en/'
```

The script will print the top 25 most frequently used words on the page, along with their counts.

## Testing

Tests are written using the Minitest framework. You can run the tests using Rake:

```sh
rake test
```

The tests in [main_test.rb](main_test.rb) cover various scenarios, including no arguments, invalid URLs, unreachable URLs, and a valid URL.
