class WebpagePrinter
  def self.print_visits(webpages)
    puts 'Page visits:'
    webpages.sort { |a, b| b.visits <=> a.visits }.each { |webpage| puts webpage.print_visits }
  end

  def self.print_unique(webpages)
    puts 'Unique page views:'
    webpages.sort { |a, b| b.unique_views <=> a.unique_views }.each { |webpage| puts webpage.print_unique_views }
  end
end
