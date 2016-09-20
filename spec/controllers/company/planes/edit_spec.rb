describe Company::PlanesController do
  let!(:user) { create :user }
  let!(:company) { create :company, user: user }
  let(:plane) { create :plane }

  context 'GET #edit' do

    before(:each) do
      sign_in user
      get :edit, id: plane.id
    end

    it 'assigns a new plane to @company_planes' do
      expect(assigns(:company_planes)).to eq(plane)
    end

    it 'renders the edit template' do
      expect(response).to render_template :edit
    end

  end
end