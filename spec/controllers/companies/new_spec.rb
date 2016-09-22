describe CompaniesController do
  let(:user) { create :user }

  context 'GET #new' do
    before(:each) do
      sign_in user
      get :new
    end

    it 'assigns a new company to @company' do
      expect(assigns(:company)).to be_a_new(Company)
    end
    it 'renders the :new template' do
      expect(response).to render_template :new
    end

  end
end