describe Admin::FlightsController do
  context 'DELETE #destroy' do
    let(:company) { create :company}
    let!(:flight) { create :flight, company: company}

    before(:each) do
      login_admin
    end

    it 'deletes the flight' do
      expect{
        delete :destroy, id: flight.id, companyname: company.name
      }.to change(Flight,:count).by(-1)
    end

    it 'redirects to contacts#index' do
      delete :destroy, id: flight.id, companyname: company.name
      expect(response).to redirect_to :action => :index
    end

  end
end