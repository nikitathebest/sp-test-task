require_relative 'webpage'
require_relative 'errors/file_format_error'

class FileParser
  
  attr_reader :file_path, :webpages

  def initialize(file_path)
    @webpages = []
    @file_path = file_path
  end

  def parse
    File.readlines(file_path).each do |log_entry|
      url, ip = log_entry.split(' ')
      raise FileFormatError, 'Incorrect file format' if url.nil? || ip.nil?
      webpage = find_webpage(url)
      webpage ? webpage.update_page(ip) : @webpages << Webpage.new(url)
    end
    webpages
  end

  def find_webpage(url)
    webpages.detect { |webpage| webpage.url == url }
  end
end
