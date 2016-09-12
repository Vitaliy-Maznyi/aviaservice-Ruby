describe Admin::FlightsController do
  let(:company) { create :company }

  context "GET #new" do

    before(:each) do
      login_admin
      get :new, companyname: company.name
    end

    it 'assigns a new flight to @admin_flights' do
      expect(assigns(:admin_flights)).to be_a_new(Flight)
    end
    it 'renders the :new template' do
      expect(response).to render_template :new
    end

  end
end