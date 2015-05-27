module ClientHelpers
  def config
    Zadarest::Config.new(api_endpoint: 'http://localhost')
  end

  def get_client_double
    double('API client').tap do |client_double|
      allow(client_double).to receive(:get)
      allow(client_double).to receive(:post)
      allow(client_double).to receive(:delete)

      allow(Zadarest::Client).to receive(:new).and_return(client_double)
    end
  end
end
