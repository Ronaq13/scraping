require 'open-uri'
require 'nokogiri'

module Parser
  def parse_from_link(link, css_selector)
    document = Nokogiri::HTML(open(link))
    document.css(css_selector).map(&:text)
  end
end
