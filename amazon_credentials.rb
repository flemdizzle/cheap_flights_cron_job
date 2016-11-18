class AmazonCredentials

  def intitialize
    @api_key = credentials['qpx']['api_key']
    @url = credentials['qpx']['url']
  end

  def credentials
    @credentials ||= YAML.load_file('api_credentials.yml')
  end
end
