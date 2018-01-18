
require 'nokogiri'
require 'open-uri'
   
page_url = "http://annuaire-des-mairies.com/95/vaureal.html" 

def get_the_email_of_a_townhal_from_its_webpage(page_url)
   page = Nokogiri::HTML(open(page_url))
   email = page.css("table[8] tr[4] td[2] p").text
   email[0] = ''
   puts email
end
get_the_email_of_a_townhal_from_its_webpage(page_url)

page_url2 = "http://annuaire-des-mairies.com/val-d-oise.html"
def get_all_the_urls_of_val_doise_townhalls(page_url)
   page = Nokogiri::HTML(open(page_url))
   emails = []
   indice = 0
   links = page.css("a[class = lientxt]")
   emails = []
   links.each do |link| 
      link[0] = ''
      emails << get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com" + link["href"])
   end
   return emails
end
puts get_all_the_urls_of_val_doise_townhalls(page_url2)
