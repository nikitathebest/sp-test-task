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
end