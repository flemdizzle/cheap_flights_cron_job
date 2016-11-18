class Integration
  load 'amazon_credentials.rb'

  def initialize
    @amz = AmazonCredentials.new
  end

  def hit_amazon
    HTTParty.get
  end
end
