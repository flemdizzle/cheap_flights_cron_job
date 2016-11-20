class AirportRequestsFormatter
  require 'yaml'

  def formatted_requests
    {
      request: {
        passengers: passengers,
        slice: itinerary
      }
    }
  end

  def passengers
    {adultCount: 1}
  end

  def itinerary

  end

  def airport_data
    YAML.load_file('airport_data.yml')
  end
end
