describe Company::PlanesController do
  context 'GET #show' do
    let!(:user) { create :user }
    let!(:company) { create :company, user: user }
    let(:plane) { create_list :plane, 4, company: company }

    before(:each) do
      sign_in user
      get :show, id: plane[1].id
    end

    it 'fills an array of planes' do
      expect(assigns(:company_planes)).to eq(plane[1])
    end

    it 'renders the :show view' do
      expect(response).to render_template :show
    end

  end
end