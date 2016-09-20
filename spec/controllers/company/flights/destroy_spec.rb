describe Company::FlightsController do
  context 'DELETE #destroy' do
    let!(:user) {create :user}
    let!(:company) {create :company, user: user}
    let!(:flight) { create :flight, company: company}

    before(:each) do
      sign_in user
    end

    it 'deletes the flight' do
      expect{
        delete :destroy, id: flight.id
      }.to change(Flight,:count).by(-1)
    end

    it 'redirects to company/flights#index' do
      delete :destroy, id: flight.id
      expect(response).to redirect_to :action => :index
    end

  end
end