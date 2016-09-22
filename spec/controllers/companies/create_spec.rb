describe CompaniesController do
  describe 'POST #create' do
    let(:user) { create :user}

    before(:each) do
      sign_in user
    end

    def post_query(name = '')
      post :create, company: attributes_for(:company, name: name )
    end

    context 'with valid attributes' do
      it 'creates a new company' do
        expect{ post_query('Airlines') }.to change(Company, :count).by(1)
      end

      it 'redirects to the root path' do
        post_query('Airlines')
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new company' do
        expect{ post_query }.to_not change(Company, :count)
      end

      it 're-renders the new template' do
        post_query
        expect(response).to render_template :new
      end
    end
  end
end