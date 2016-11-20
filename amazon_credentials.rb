class QpxExpressCredentials
  require 'yaml'
  attr_reader :api_key, :url

  def initialize
    @api_key = credentials['qpx_express']['api_key']
    @url = credentials['qpx_express']['url']
  end

  def credentials
    YAML.load_file('api_credentials.yml')
  end
end
