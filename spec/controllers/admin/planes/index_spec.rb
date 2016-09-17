describe Admin::PlanesController do
  context 'GET #index' do
    let(:company) {create :company, name: 'Air1'}
    let(:admin_planes_list) { create_list(:plane, 4, company: company) }

    before(:each) do
      login_admin
      get :index, companyname: company.name
    end

    it 'fills an array of planes' do
      expect(assigns(:admin_planes)).to match_array(admin_planes_list)
    end

    it 'renders the :index view' do
      expect(response).to render_template :index
    end

  end
end