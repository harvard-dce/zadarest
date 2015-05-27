describe Zadarest::Pools do
  include ClientHelpers

  context 'all' do
    it 'uses Zadarest::Client#get to get a list of pools' do
      client_double = get_client_double
      client = described_class.new(config: config)
      client.all

      expect(client_double).to have_received(:get).with(
        url: '/api/pools.json',
        params: { start: 0, limit: 100 }
      )
    end

    it 'accepts parameters related to pagination' do
      client_double = get_client_double
      client = described_class.new(config: config)
      client.all(start: 1, limit: 100)

      expect(client_double).to have_received(:get).with(
        url: '/api/pools.json', 
        params: { start: 1, limit: 100 }
      )
    end
  end

  context 'show' do
    it 'gets a single pool' do
      pool_name = 'pool-name'
      client_double = get_client_double
      client = described_class.new(config: config)
      client.show(pool_name: pool_name)

      expect(client_double).to have_received(:get).with(url: %Q|/api/pools/#{pool_name}.json|)
    end
  end

  context 'create' do
    it 'creates a pool via post' do
      params = {
        display_name: 'display name',
        capacity: '100G',
        raid_groups: 'group1,group2',
        pooltype: 'Repository'
      }
      client_double = get_client_double
      client = described_class.new(config: config)
      client.create(params)

      expect(client_double).to have_received(:post).with(
        url: '/api/pools.json',
        params: params
      )
    end
  end
end
