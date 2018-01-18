
require 'nokogiri'
require 'open-uri'
   
url="http://www.mon-incubateur.com/site_incubateur/incubateurs"


def global(url)
	page = Nokogiri::HTML(open(url))   
	
	noms = page.css("span[font-weight = bold]")
	tab_noms=[]
	noms.each do |nom|
		tab_noms << nom.text
	end

	puts tab_noms
end




global(url)