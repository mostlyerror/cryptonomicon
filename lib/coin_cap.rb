module Api
  class CoinCap < Base
    def request
      super(:get, url)
    end

    def parsed_response(response)
      response.dig('data', 'priceUsd').to_f
    end

    private 

    def url
      "https://api.coincap.io/v2/assets/#{@opts[:name]}"
    end
  end
end
