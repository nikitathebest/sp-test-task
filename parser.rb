require_relative 'lib/file_parser'

file_path = ARGV.first
file_parser = FileParser.new(file_path)
webpages = file_parser.parse

WebpagePrinter.print_visits(webpages)
WebpagePrinter.print_unique(webpages)
