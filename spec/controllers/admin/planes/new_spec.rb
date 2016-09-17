describe Admin::PlanesController do
  let(:company) { create :company }

  context "GET #new" do

    before(:each) do
      login_admin
      get :new, companyname: company.name
    end

    it 'assigns a new plane to @admin_planes' do
      expect(assigns(:admin_planes)).to be_a_new(Plane)
    end
    it 'renders the :new template' do
      expect(response).to render_template :new
    end

  end
end