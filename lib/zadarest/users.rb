module Zadarest
  class Users
    def initialize(config: nil)
      @config = config
      @client = Client.new(config: config)
    end

    def all(start: 0, limit: 100)
      client.get(
        url: '/api/users.json',
        params: { start: start, limit: limit },
        root_key: nil
      )
    end

    def create(params = {})
      client.post(
        url: '/api/users.json',
        params: params,
        root_key: nil
      )
    end

    def delete(username: '')
      client.delete(
        url: %Q|/api/users/#{username}.json|,
        root_key: nil
      )
    end

    private

    attr_reader :config, :client
  end
end
