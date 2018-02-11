require './eidoo'

# returns an array of coin objects
# from Eidoo.io, and assigns it to coins
coins = Eidoo.new.coins

items = [
  "BMC",
  "IND",
  "MGO",
  "NET",
  "NEU",
  "PRO",
  "SRN",
  "STX",
  "TAAS",
  "XID"
]

items.each do |sym|
  target = coins.select { |coin| coin.symbol == sym }.first
  puts "#{target.symbol}, #{target.price}"
end








# require 'httparty'
# require 'nokogiri'

# api = 'https://eidoo.io/erc20-tokens-list/'

# response = HTTParty.get(api)
# response_body = response.body

# data = Nokogiri::HTML response_body

# coins = data.css('tr#coinRow')
# results = []

# # ^\w{1,}\s\(

# coins.each do |coin|
#   h = {}
#   coin_info = coin.css('.coin h4').text
#   h[:coin_symbol] = /\(\w{1,}\)/.match(coin_info).to_s[1..-2]    # select everything inside ()
#   h[:coin_name] = /^.*\(/.match(coin_info).to_s[0..-2].strip  # select everything until the opening (
#   # h[:market_cap] = coin.css('.market h4').text[1..-1].delete(",").to_i   # strip out commas and leading $
#   results << h
# end

# p results
# # coin_info = coins[10].css('.coin h4').to_s
# # p /\([A-Z]{1,}\)/.match(coin_info).to_s[1..-2]

# target_coins = [
#   "BMC",
#   "IND",
#   "MGO",
#   "NET",
#   "NEU",
#   "PRO",
#   "SRN",
#   "STX",
#   "TAAS",
#   "XID"
# ]



# # coins = data.css('.coin h4')
# # coins.each do |coin|
# #   p coin
# # end



# # coins = [
# #   "BMC",
# #   "IND",
# #   "MGO",
# #   "NET",
# #   "NEU",
# #   "PRO",
# #   "SRN",
# #   "STX",
# #   "TAAS",
# #   "XID"
# # ]

# # target_pairs = coins.map { |coin| coin.downcase + "_eth"}

# # liqui_base_api = "https://api.liqui.io/api/3/"
# # url = liqui_base_api + 'info/'
# # response =  HTTParty.get url
# # pairs = response.parsed_response["pairs"]

# # result = []
# # target_pairs.each do |pair|
# #   result << [pair, pairs[pair]]
# # end

# # result.each do |item|
# #   puts "#{item[0]}, #{item[1]['fee']}"
# # end