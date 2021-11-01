require_relative "./lib/base.rb"
require_relative "./lib/coinbase.rb"
require_relative "./lib/coin_gecko.rb"
require_relative "./lib/coin_paprika.rb"
require_relative "./lib/coin_cap.rb"
require_relative "./lib/crypto_compare.rb"

module Api
  class Wrapper < Base
    %w[
      coinbase
      coin_cap
      coin_gecko
      coin_paprika
      crypto_compare
    ].each do |api|
      define_method(api.to_sym) do 
        Object.const_get("Api::#{klassify(api)}").new(@opts).request
      end
    end

    def klassify(name)
      name.split('_').map(&:capitalize).join
    end
  end
end
