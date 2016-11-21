class QpxResponseParser

  def initialize(response)
    @response = response
  end

  def parse_and_save
    parse_flight_data
    save_to_postgres
  end

  def parse_and_save

  end

  def save_to_postgres

  end

end
