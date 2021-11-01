module Api
  class CoinGecko < Base
    def request
      super(:get, url)
    end

    def parsed_response(response)
      pair = @opts.fetch(:pair, "usd")
      response.dig("market_data", "current_price", pair)
    end

    private 

    def url
      "https://api.coingecko.com/api/v3/coins/#{@opts[:name]}"
    end
  end
end
