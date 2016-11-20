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
      body: {
        request: {
          passengers: {
            adultCount: 1
          },
          slice: [
            {
              origin: 'SFO',
              destination: 'LAX',
              date: '2014-09-19'
            }
          ],
          solutions: 1
        }
      }
    }
  end
end
