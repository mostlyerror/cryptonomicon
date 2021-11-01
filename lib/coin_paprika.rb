module Api
  class CoinPaprika < Base
    def request
      super(:get, url)
    end

    def parsed_response(response)
      response.first['close'].to_f
    end

    private 

    def url
      "https://api.coinpaprika.com/v1/coins/#{@opts[:symbol]}-#{@opts[:name]}/ohlcv/today"
    end
  end
end
