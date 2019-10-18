require_relative 'lib/file_parser'

file_path = ARGV.first
file_parser = FileParser.new(file_path)
webpages = file_parser.parse

webpages.each { |webpage| puts webpage.print_visits }