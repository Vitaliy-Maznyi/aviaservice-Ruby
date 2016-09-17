describe Admin::PlanesController do
  let(:company) { create :company }
  let(:plane) { create :plane }

  context 'GET #edit' do

    before(:each) do
      login_admin
      get :edit, companyname: company.name, id: plane.id
    end

    it 'assigns a new plane to @admin_planes' do
      expect(assigns(:admin_planes)).to eq(plane)
    end

    it 'renders the edit template' do
      expect(response).to render_template :edit
    end

  end
end