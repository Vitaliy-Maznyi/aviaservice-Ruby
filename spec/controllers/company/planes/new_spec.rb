describe Company::PlanesController do
  let!(:user) { create :user }
  let!(:company) { create :company, user: user }

  context "GET #new" do

    before(:each) do
      sign_in user
      get :new
    end

    it 'assigns a new plane to @company_planes' do
      expect(assigns(:company_planes)).to be_a_new(Plane)
    end
    it 'renders the :new template' do
      expect(response).to render_template :new
    end

  end
end