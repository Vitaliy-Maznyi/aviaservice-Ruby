describe Flight do

  let(:flight) { create :flight, number: 'flight1' }

  before(:each) do
    create_list(:order, 3, flight: flight)
  end

  it 'counts available econom tickets' do
    expect(flight.available_econom_tickets).to eq(13)
  end

  it 'counts available business tickets' do
    expect(flight.available_business_tickets).to eq(3)
  end

end