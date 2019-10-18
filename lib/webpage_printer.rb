class WebpagePrinter
  def self.print_visits(webpages)
    puts 'Page visits:'
    webpages.sort_by(&:visits).reverse.each { |webpage| puts webpage.print_visits }
  end

  def self.print_unique(webpages)
    puts 'Unique page views:'
    webpages.sort_by(&:unique_views).reverse.each { |webpage| puts webpage.print_unique_views }
  end
end
