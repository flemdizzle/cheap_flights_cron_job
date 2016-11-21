class AirportRequestsFormatter
  require 'yaml'

  def formatted_requests
    [
      {
        request: {
          passengers: passengers,
          slice: [itinerary]
        }
      }
    ]
  end

  def passengers
    {adultCount: 1}
  end

  def itinerary
    {
      origin: airport_data['origin'],
      destination: airport_data['destination'],
      date: formatted_date
    }
  end

  def formatted_date
    @now ||= Time.now
    "#{@now.year}-#{@now.month + 1}-#{@now.day}"
  end

  def airport_data
    YAML.load_file('airport_data.yml')
  end
end
