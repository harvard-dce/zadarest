module Zadarest
  class Pools
    def initialize(config: nil)
      @config = config
      @client = Client.new(config: config)
    end

    def all(start: 0, limit: 100)
      client.get(
        url: '/api/pools.json',
        params: { start: start, limit: limit }
      )
    end

    def create(params = {})
      client.post(
        url: '/api/pools.json',
        params: params
      )
    end

    def show(pool_name: '')
      client.get(url: %Q|/api/pools/#{pool_name}.json|)
    end

    private

    attr_reader :config, :client
  end
end
