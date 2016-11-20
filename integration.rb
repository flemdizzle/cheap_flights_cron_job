class Integration
  load 'amazon_credentials.rb'
  require 'httparty'

  def initialize
    @amz = AmazonCredentials.new
  end

  def hit_amazon
    HTTParty.post(@amz.url, options)
  end

  def options
    {
      query: {
        key: @amz.api_key,
      },
      body: request
    }
  end

  def request
    {
      request: {
        passengers: {
          adultCount: 1
        },
        slice: [
          {
            origin: 'BOS',
            destination: 'LAX',
            date: '2017-01-01'
          },
          {
            origin: 'LAX',
            destination: 'BOS',
            date: '2017-01-02'
          }
        ]
      }
    }
  end
end
