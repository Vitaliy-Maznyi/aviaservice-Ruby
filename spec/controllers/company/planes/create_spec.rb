describe Company::PlanesController do
  describe 'POST #create' do
    let!(:user) { create :user }
    let!(:company) { create :company, user: user }
    let!(:plane) { create :plane, company: company }

    before(:each) do
      sign_in user
    end

    def post_query(eco_seats = 35)
      post :create, plane: attributes_for(:plane, company_id: company.id, econom_seats: eco_seats)
    end

    context 'with valid attributes' do
      it 'creates a new plane' do
        expect{ post_query }.to change(Plane, :count).by(1)
      end

      it 'redirects to the company/planes index' do
        post_query
        expect(response).to redirect_to :action => :index
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new plane' do
        expect{ post_query('') }.to_not change(Plane, :count)
      end

      it 're-renders the new template' do
        post_query('')
        expect(response).to render_template :new
      end
    end
  end
end