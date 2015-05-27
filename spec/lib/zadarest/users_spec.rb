describe Zadarest::Users do
  include ClientHelpers

  context 'all' do
    it 'gets a list of users' do
      client_double = get_client_double
      client = described_class.new(config: config)
      client.all

      expect(client_double).to have_received(:get).with(
        url: '/api/users.json',
        params: { start: 0, limit: 100 },
        root_key: nil
      )
    end
  end

  context 'create' do
    it 'creates a user via post' do
      params = {
        username: 'foo@example.com',
        email: 'foo'
      }
      client_double = get_client_double
      client = described_class.new(config: config)
      client.create(params)

      expect(client_double).to have_received(:post).with(
        url: '/api/users.json',
        params: params,
        root_key: nil
      )
    end
  end

  context 'delete' do
    it 'deletes a user by username via DELETE' do

      username = 'djcp'
      client_double = get_client_double
      client = described_class.new(config: config)
      client.delete(username: 'djcp')

      expect(client_double).to have_received(:delete).with(
        url: %Q|/api/users/#{username}.json|,
        root_key: nil
      )
    end
  end
end
