require 'minitest/autorun'

class TestMain < Minitest::Test
  def test_that_no_arguments_gives_error_message
    ARGV[0] = nil
    assert_output("Expected a valid URL to be passed as an argument.\n") { load 'main.rb' }
  end

  def test_that_an_invalid_url_gives_error_message
    ARGV[0] = 'test123'
    assert_output("Expected a valid URL to be passed as an argument.\n") { load 'main.rb' }
  end

  def test_that_an_unreachable_url_gives_unreachable_warning
    ARGV[0] = 'https://someunreachablesite1234567890.com'
    assert_output("Unable to reach '#{ARGV[0]}'. Please try again later.\n") { load 'main.rb' }
  end

  def test_that_valid_url_extractes_the_top_25_used_words_with_counts
    ARGV[0] = 'https://www.ruby-lang.org/en/'
    expected = <<~EOS
      ruby: 35
      a: 15
      by: 11
      on: 11
      in: 10
      posted: 10
      released: 10
      the: 10
      new: 7
      adds: 6
      and: 6
      named: 6
      naruse: 6
      parser: 6
      community: 5
      is: 5
      news: 5
      of: 5
      to: 5
      about: 4
      continue: 4
      preview: 4
      quot: 4
      reading: 4
      world: 4
    EOS
    assert_output(expected) { load 'main.rb' }
  end
end
