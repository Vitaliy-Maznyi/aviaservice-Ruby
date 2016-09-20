describe Company::PlanesController do
  context 'GET #index' do
    let!(:user) { create :user }
    let!(:company) { create :company, user: user }
    let(:company_planes_list) { create_list(:plane, 4, company: company) }

    before(:each) do
      sign_in user
      get :index
    end

    it 'fills an array of planes' do
      expect(assigns(:company_planes)).to match_array(company_planes_list)
    end

    it 'renders the :index view' do
      expect(response).to render_template :index
    end

  end
end