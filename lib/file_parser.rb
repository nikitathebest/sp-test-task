require_relative 'webpage'
require_relative 'webpage_printer'

class FileParser
  attr_reader :file_path, :webpages

  def initialize(file_path)
    @webpages = []
    @file_path = file_path
  end

  def parse
    check_file_presence

    File.readlines(file_path).each do |log_entry|
      url, ip = log_entry.split(' ')
      raise StandardError, 'Incorrect file format' if url.nil? || ip.nil?

      webpage = find_webpage(url)
      webpage ? webpage.update_page(ip) : @webpages << Webpage.new(url)
    end
    webpages
  end

  def find_webpage(url)
    webpages.detect { |webpage| webpage.url == url }
  end

  def check_file_presence
    raise StandardError, 'File is not present' unless File.file?(file_path)
    raise StandardError, 'Incorrect file extension' if File.extname(file_path) != '.log'
  end
end
