require 'httparty'
require 'nokogiri'

class Eidoo
  # scrapes eidoo.io
  
  def initialize

    # configuration
    api = 'https://eidoo.io/erc20-tokens-list/'
    response = HTTParty.get(api)
    response_body = response.body
    data = Nokogiri::HTML response_body

    # compile data on each coin into an array
    @coin_data = data.css('tr#coinRow')

    # populate Coin objects into coins array
    @coins = []
    counter = 0
    @coin_data.each do |data|
      @coins.push(Coin.new data)
      if counter == 12
        p data.css('.market h4').text
      end
      counter += 1
    end
  end

  def coins
    return @coins
  end

  private

  def get_data
    return @data
  end

end

class Coin
  # dependent on Eidoo instance

  # takes a nokogiri object
  # from css-selected row
  def initialize(data)
    name_info = data.css('.coin h4').text
    @market_cap = data.css('.market h4').text

    @symbol = /\(\w{1,}\)/.match(name_info).to_s[1..-2]    # select everything inside ()
    @name = /^.*\(/.match(name_info).to_s[0..-2].strip  # select everything until the opening (
    
    # @market_cap = market_cap
    #data.css('.market h4').text #.text[1..-1].delete(",").to_i   # strip out commas and leading $
  end

  def symbol
    return @symbol
  end

  def name
    return @name
  end

  def market_cap
    return @market_cap
  end
end

# connection = Eidoo.new
# # p connection.coins
# connection.coins.each do |coin|
#   puts "#{coin.name} (#{coin.symbol}) - #{coin.market_cap}"
# end
# # p connection.coins.first