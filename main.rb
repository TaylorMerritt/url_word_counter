require 'nokogiri'
require 'open-uri'

def get_html(url)
  Nokogiri::HTML(URI.open(url))
end

def get_body(url)
  get_html(url).xpath('//body')
end

def remove_non_text_elements(html)
  html.search('script', 'style').remove
end

def invalid_request(url)
  return true if url.nil?
  return true unless url =~ URI::regexp

  return false
end

def get_word_counts(text)
  accumulator = StringIO.new
  word_counts = Hash.new(0)

  text.each_char do |char|
    char = char.downcase

    if char.match(/[\p{L}']/)
      accumulator << char
    elsif accumulator.length.zero?
      next
    else
      word_counts[accumulator.string] += 1
      accumulator = StringIO.new
    end
  end

  return word_counts
end

def print_word_counts(word_counts)
  word_counts
    .sort_by { |k, v| [ -v, k ] }
    .first(25)
    .to_h
    .each { |k, v| puts "#{k}: #{v}"}
end

url = ARGV[0]

return puts "Expected a valid URL to be passed as an argument." if invalid_request(url)

html = begin
  get_body(url)
rescue
  return puts "Unable to reach '#{url}'. Please try again later."
end

remove_non_text_elements(html)
word_counts = get_word_counts(html.text)
print_word_counts(word_counts)
