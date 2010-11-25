# Generates Fund ID Reference page for the wiki at
# http://code.google.com/p/sgmf-uwa/wiki/FundIdReference

require 'rubygems'
require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open('http://www.fundsupermart.com/main/home/index.svdo'))
funds = doc.css('select.fundselect[name=dest] option')

output = "= Fund ID Reference =\n"
output << "_As of #{Time.now.strftime('%d %b %Y')}_\n\n"
output << "|| *Fund Name* || *Fund ID* ||\n"

funds.drop(1).each do |fund|
  output << '|| '
  output << fund.content
  output << ' || '
  output << fund.attribute('value').value.gsub(/^.*=/, '')
  output << " ||\n"
end

puts output

