class Integration
  load 'qpx_express_credentials.rb'
  load 'airport_requests_formatter.rb'
  load 'qpx_response_parser.rb'
  require 'httparty'
  require 'mongo'

  def initialize
    @qpx = QpxExpressCredentials.new
    @requests = AirportRequestsFormatter.new.formatted_requests
    @mongo = initialize_mongo
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
    QpxResponseParser.new(response).parse_and_save
    store_in_mongo(response)
  end

  def store_in_mongo(response)
    collection = @mongo[:qpx_json]
    collection.insert_one(response)
  end

  def initialize_mongo
    Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'flight_data')
  end

end
