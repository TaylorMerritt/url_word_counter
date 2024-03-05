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

## Assumptions Made/Notes

I leaned towards simplicity and ended up just using a single script to do all of the work. With more time I would've setup a web scraping class that would be easier to test. I believe the tests I wrote with minitest cover all of the test cases.

I am more familiar testing with RSpec, but opted for minitest since it's included with Ruby.

I am also more familiar with using Ruby as a part of Ruby on Rails as opposed to creating CLI tools.
