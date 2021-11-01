module Api
  class Coinbase < Base
    def request
      super(:get, url)
    end

    def parsed_response(response)
      response.dig("data", "amount")
    end

    private 

    def url
      pair = @opts.fetch(:pair, "usd")
      "https://api.coinbase.com/v2/prices/#{@opts[:symbol]}-#{pair}/spot"
    end
  end
end
