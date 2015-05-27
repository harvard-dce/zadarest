$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'zadarest'
require 'pry'

def read_json_file(file_name)
  File.read(%Q|spec/support/files/#{file_name}|)
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
