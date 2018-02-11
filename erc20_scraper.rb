require 'httparty'
require 'nokogiri'

api = 'https://eidoo.io/erc20-tokens-list/'

response = HTTParty.get(api)
response_body = response.body

data = Nokogiri::HTML response_body
coins = data.css('.coin h4')
coins.each do |coin|
  p coin.text
end

# def parse_coin(coin_str)
#   coin_str = coin_str.strip
#   coin_name = ""
#   coin_sym = ""
#   setting = 1

#   len = coin_str.length
#   n = 0
#   while n < len
#     while setting == 1
#       coin_name << coin_str[n]
#       n += 1
#       setting += 1 if coin_str[n] != "("
#     end
#     n += 1
#   end
#   p n
    
#   return coin_name
# end

# str = "Wi Coin (WIC) "
# p parse_coin str