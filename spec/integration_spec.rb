require_relative '../integration'

describe Integration do

  subject { Integration.new }

  let(:requests) do
    [
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
    ]
  end

  before do
    allow_any_instance_of(AirportRequestsFormatter).to receive(:formatted_requests).and_return(requests)
  end

  it 'is true' do
    expect(true).to eq(true)
  end

  describe 'post_qpx_express' do

    let(:response) { {response: true} }
    before do
      allow(HTTParty).to receive(:post).and_return(response)
      allow(subject).to receive(:process_response)
    end

    it 'sends each request to google' do
      expect(HTTParty).to receive(:post).once
      subject.post_qpx_express
    end
  end
end

