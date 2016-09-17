describe Admin::PlanesController do
  context 'GET #show' do
    let(:company) {create :company, name: 'Air1'}
    let(:plane) { create_list :plane, 4, company: company }

    before(:each) do
      login_admin
      get :show, companyname: company.name, id: plane[1].id
    end

    it 'fills an array of planes' do
      expect(assigns(:admin_planes)).to eq(plane[1])
    end

    it 'renders the :show view' do
      expect(response).to render_template :show
    end

  end
end