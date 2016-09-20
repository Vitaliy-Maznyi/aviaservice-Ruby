describe Company::FlightsController do
  let!(:user) {create :user}
  let!(:company) {create :company, user: user}
  let(:flight) { create :flight }

  context 'GET #edit' do

    before(:each) do
      sign_in user
      get :edit, id: flight.id
    end

    it 'assigns a new flight to @company_flights' do
      expect(assigns(:company_flights)).to eq(flight)
    end

    it 'renders the edit template' do
      expect(response).to render_template :edit
    end

  end
end