
require 'nokogiri'
require 'open-uri'
url="https://coinmarketcap.com/all/views/all/"

def cours_cryptomonnaie(url)
	page = Nokogiri::HTML(open(url))

	prices = page.css("a[class = price]")
	tab_prices=[]
	prices.each do |price|
		tab_prices << price.text
	end
	
	symbols = page.css("span[class = currency-symbol]")
	tab_symbols=[]
	symbols.each do |symbol|
		tab_symbols << symbol.text
	end

	names = page.css("a[class=currency-name-container]")
	tab_names=[]
	names.each do |names|
		tab_names << names.text
	end

	marketcap = page.css("td[class = 'no-wrap market-cap text-right']")
	tab_marketcaps=[]
	marketcap.each do |market|
		tab_marketcaps << market.text
	end
	cours = []
    taille = tab_names.length
    indice = 0
    while indice < taille
       cour_hash = Hash.new
       cour_hash[:name] = tab_names[indice]
       cour_hash[:symbol] = tab_symbols[indice]
       cour_hash[:price] = tab_prices[indice]
       indice += 1
       cours << cour_hash
    end

    puts cours


end
cours_cryptomonnaie(url)


