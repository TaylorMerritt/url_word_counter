require 'open-uri'

def get_html(url)
  page = open(url)
  return page.read
end

def invalid_request(url)
  return true if url.nil?
  return true unless url =~ URI::regexp

  return false
end

url = ARGV[0]

return puts "Expected a valid URL to be passed as an argument." if invalid_request(url)

html = begin
  get_html(url)
rescue
  return puts "Unable to reach '#{url}'. Please try again later."
end

in_tag = false
accumulator = StringIO.new
word_counts = Hash.new(0)

html.each_char do |char|
  if char == '<'
    in_tag = true
  elsif char == '>'
    in_tag = false
    next
  end

  if in_tag
    next
  end

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

word_counts
  .sort_by { |k, v| [ -v, k ] }
  .first(25)
  .to_h
  .each { |k, v| puts "#{k}: #{v}"}
