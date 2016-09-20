describe Company::FlightsController do
  context 'GET #index' do
    let!(:user) {create :user}
    let!(:company) {create :company, user: user}
    let(:company_flight_list) { create_list(:flight, 4, company: company) }

    before(:each) do
      sign_in user
      get :index
    end


    it 'fills an array of flights' do
      expect(assigns(:company_flights)).to match_array(company_flight_list)
    end

    it 'renders the :index view' do
      expect(response).to render_template :index
    end

  end
end