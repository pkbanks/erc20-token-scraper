require 'HTTParty'

response = HTTParty.get('https://bittrex.com/api/v1.1/public/getcurrencies')
bittrex_coins = response.parsed_response["result"]

eth_type = []
sanitized_coins = []

bittrex_coins.each do |bc|
  if bc["CoinType"] == "ETH_CONTRACT"
    eth_type << bc["Currency"]
  end
end

liqui_coins = ARGV.join().tr('[]', '').split(',')

liqui_coins.each do |lc|
  if !eth_type.include? lc
    sanitized_coins << lc
  end
end

puts '----------------Sanitized Coins----------------------'
p sanitized_coins