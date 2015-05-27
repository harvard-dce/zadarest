describe Zadarest::Config do
  it 'stores the access key from the initializer' do
    access_key = 'FOOBAR'
    config = described_class.new(access_key: 'FOOBAR')

    expect(config.access_key).to eq access_key
  end

  context 'timeout' do
    it 'has a default timeout' do
      expect(described_class.new.http_timeout).to eq -1
    end

    it 'stores the http_timeout' do
      http_timeout = 10
      config = described_class.new(http_timeout: http_timeout)

      expect(config.http_timeout).to eq http_timeout
    end
  end

  context 'api endpoint' do
    it 'has stores an API endpoint' do
      endpoint = 'https://foobar'
      config = described_class.new(api_endpoint: endpoint)

      expect(config.api_endpoint).to eq endpoint
    end
  end
end
