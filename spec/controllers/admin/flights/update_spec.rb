describe Admin::FlightsController do
  let(:company) {create :company}
  let(:flight) {create :flight, company: company}
  let(:valid_attr) do
    { :number => 'new_number', :from => 'new city' }
  end
  let(:invalid_attr) do
    {:number => '', :from => 'new city'}
  end

  def put_update(attr)
    put :update, companyname: company.name, id: flight.id, flight: attr
    flight.reload
  end

  before(:each) do
    login_admin
  end

  context 'with invalid attributes' do
    it 're-renders the edit template' do
      put_update(invalid_attr)
      expect(response).to render_template :edit
    end

    it 'does not change values' do
      put_update(invalid_attr)
      expect(flight.number).not_to eq(invalid_attr[:number])
    end
  end

  context 'with valid attributes' do
    it 'redirects to index action' do
      put_update(valid_attr)
      expect(response).to redirect_to :action => :index
    end

    it 'updates values' do
      put_update(valid_attr)
      expect(flight.number).to eq(valid_attr[:number])
    end
  end

end