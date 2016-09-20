describe Company::FlightsController do
  let!(:user) {create :user}
  let!(:company) {create :company, user: user}

  context "GET #new" do

    before(:each) do
      sign_in user
      get :new
    end

    it 'assigns a new flight to @company_flights' do
      expect(assigns(:company_flights)).to be_a_new(Flight)
    end
    it 'renders the :new template' do
      expect(response).to render_template :new
    end

  end
end