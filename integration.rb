class Integration
  load 'qpx_express_credentials.rb'
  load 'airport_requests_formatter.rb'
  require 'httparty'

  def initialize
    @qpx = QpxExpressCredentials.new
    @requests = AirportRequestsFormatter.new.formatted_requests
  end

  def run
    hit_qpx_express
  end

  def hit_qpx_express
    @requests.each do |request|
      response = HTTParty.post(@qpx.url, options(request))
      process_response(response)
    end
  end

  def options(request)
    {
      query: {
        key: @qpx.api_key,
      },
      headers: {
        'Content-Type' => 'application/json'
      },
      body: request.to_json
    }
  end

  def process_response(response)
    puts response
  end

end
