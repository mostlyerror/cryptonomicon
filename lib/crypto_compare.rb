module Api
  class CryptoCompare < Base
    def request
      super(:get, url)
    end

    def parsed_response(response)
      response.dig('USD').to_f
    end

    private 

    def url
      "https://min-api.cryptocompare.com/data/price?fsym=#{@opts[:symbol]}&tsyms=usd"
    end
  end
end
