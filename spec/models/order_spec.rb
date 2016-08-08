describe Order do

  context 'when create an order' do
    let(:order) {create :order}

    it 'raises error if there are no free econom tickets' do
      order.econom_seats = 100
      order.send(:tickets_count)
      expect(order.errors[:base]).to include('No free econom tickets')
    end

    it 'raises error if there are no free business tickets' do
      order.business_seats = 100
      order.send(:tickets_count)
      expect(order.errors[:base]).to include('No free business tickets')
    end

    it 'should be valid' do
      order.send(:tickets_count)
      expect(order).to be_valid
    end
  end
end
