class Webpage
  attr_accessor :url, :ips, :visits

  def initialize(url)
    @url = url
    @ips = []
    @visits = 1
  end

  def update_page(ip)
    @visits += 1
    ips << ip
  end

  def print_visits
    "#{url} #{visits} visits"
  end

  def print_unique_views
    "#{url} #{unique_views} unique views"
  end

  def unique_views
    ips.uniq.count
  end
end