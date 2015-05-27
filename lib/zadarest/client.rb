module Zadarest
  class Client
    def initialize(config: nil)
      @config = config
      @client = Faraday.new(url: config.api_endpoint) do |f|
        f.request :url_encoded
        f.adapter Faraday.default_adapter
      end
    end

    def post(url: '', params: {}, root_key: 'response')
      response = client.post(
        url, params.to_json, default_headers
      )
      extract_root_json_data_structure(response, root_key)
    end

    def get(url: '', params: {}, root_key: 'response')
      response = client.get(
        url, params, default_headers
      )
      extract_root_json_data_structure(response, root_key)
    end

    def delete(url: '', root_key: '')
      response = client.delete(
        url, {}, default_headers
      )
      extract_root_json_data_structure(response, root_key)
    end

    private

    def extract_root_json_data_structure(response, root_key)
      json = JSON.parse(response.body)
      get_root_data_structure(json, root_key)
    end

    def default_headers
      {
        'X-Access-Key' => config.access_key,
        'Content-Type' => 'application/json'
      }
    end

    def get_root_data_structure(json, root_key)
      if root_key
        json[root_key]
      else
        json
      end
    end

    attr_accessor :client, :config
  end
end
