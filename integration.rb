class Integration
  load 'amazon_credentials.rb'
  require 'httparty'

  def initialize
    @amz = AmazonCredentials.new
  end

  def hit_amazon
    HTTParty.get
  end
end
