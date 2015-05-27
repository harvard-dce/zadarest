module Zadarest
  class Config
    attr_reader :access_key, :http_timeout, :api_endpoint

    def initialize(access_key: nil, http_timeout: -1, api_endpoint: '')
      @access_key = access_key
      @http_timeout = http_timeout
      @api_endpoint = api_endpoint
    end
  end
end
