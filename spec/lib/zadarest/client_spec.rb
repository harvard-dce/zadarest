describe Zadarest::Client do
  it 'gets the api_endpoint from the config object' do
    api_endpoint = 'http://example.com'
    config = Zadarest::Config.new(api_endpoint: api_endpoint)
    allow(Faraday).to receive(:new)

    described_class.new(config: config)

    expect(Faraday).to have_received(:new).with(url: api_endpoint)
  end

  context 'get' do
    it 'uses the faraday client correctly' do
      faraday_double = get_faraday_double
      url = '/foobar'
      params = { param1: 1 }

      config = Zadarest::Config.new(access_key: access_key)
      client = described_class.new(config: config)
      client.get(url: url, params: params)

      expect(faraday_double).to have_received(:get).with(
        url, params, default_faraday_headers
      )
    end
  end

  context 'post' do
    it 'uses the faraday client correctly' do
      faraday_double = get_faraday_double
      url = '/foobar'
      params = { param1: 1 }
      json_encoded_params = params.to_json

      config = Zadarest::Config.new(access_key: access_key)
      client = described_class.new(config: config)
      client.post(url: url, params: params)

      expect(faraday_double).to have_received(:post).with(
        url, json_encoded_params, default_faraday_headers
      )
    end

  end

  context 'delete' do
    it 'uses the faraday client correctly' do
      faraday_double = get_faraday_double
      url = '/foobar'

      config = Zadarest::Config.new(access_key: access_key)
      client = described_class.new(config: config)
      client.delete(url: url)

      expect(faraday_double).to have_received(:delete).with(
        url, {}, default_faraday_headers
      )
    end
  end

  it 'parses the returned json packet' do
    config = Zadarest::Config.new
    client_double = client_double_returning '{"response": { "key": "value"} }'
    allow(Faraday).to receive(:new).and_return(client_double)

    client = described_class.new(config: config)

    response = client.get(url: '/')

    expect(response).to respond_to(:keys)
  end

  it 'removes the root response key' do
    config = Zadarest::Config.new
    client_double = client_double_returning '{"response": { "key": "value"} }'
    allow(Faraday).to receive(:new).and_return(client_double)

    client = described_class.new(config: config)

    response = client.get(url: '/')

    expect(response.keys).to eq ['key']
  end

  def client_double_returning(content = '{}')
    response_double = double('response', body: content)
    double('client').tap do |client_double|
      allow(client_double).to receive(:get).and_return(response_double)
    end
  end

  def default_faraday_headers
    {
      'X-Access-Key' => access_key,
      'Content-Type' => 'application/json'
    }
  end

  def access_key
    'blerp'
  end

  def get_faraday_double
    double("Faraday client").tap do |faraday_double|
      response_double = double('faraday response')
      allow(response_double).to receive(:body).and_return('{ "key": "value" }')
      allow(faraday_double).to receive(:get).and_return(response_double)
      allow(faraday_double).to receive(:post).and_return(response_double)
      allow(faraday_double).to receive(:delete).and_return(response_double)
      allow(Faraday).to receive(:new).and_return(faraday_double)
    end
  end
end
