describe Admin::FlightsController do

  context 'GET #index' do
    let(:company) {create :company, name: 'Air1'}
    let(:admin_flight) { create_list(:flight, 4, company: company) }

    before(:each) do
      login_admin
      get :index, :companyname => 'Air1'
    end


    it 'fills an array of flights' do
      expect(assigns(:admin_flights)).to match_array(admin_flight)
    end

    it 'renders the :index view' do
      expect(response).to render_template :index
    end

  end
end
