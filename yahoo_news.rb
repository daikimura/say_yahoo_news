require 'rexml/document'
require 'open-uri'

appid = "APPID"
pickupcategory = "top"
uri = 'http://news.yahooapis.jp/NewsWebService/V2/topics'
results = []
body = open("#{uri}?appid=#{appid}&pickupcategory=#{pickupcategory}")
doc = REXML::Document.new(body).elements['ResultSet/']
doc.elements.each('Result/Title') do |item|
  results.push(item.text)
end

results.each do |title|
    system "say " + title
end