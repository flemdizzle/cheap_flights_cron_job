class AmazonCredentials
  require 'yaml'
  attr_reader :api_key, :url

  def initialize
    @api_key = credentials['qpx']['api_key']
    @url = credentials['qpx']['url']
  end

  def credentials
    YAML.load_file('api_credentials.yml')
  end
end
