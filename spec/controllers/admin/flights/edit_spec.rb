describe Admin::FlightsController do
  let(:company) { create :company }
  let(:flight) { create :flight }

  context 'GET #edit' do

    before(:each) do
      login_admin
      get :edit, companyname: company.name, id: flight.id
    end

    it 'assigns a new flight to @admin_flights' do
      expect(assigns(:admin_flights)).to eq(flight)
    end

    it 'renders the edit template' do
      expect(response).to render_template :edit
    end

  end
end