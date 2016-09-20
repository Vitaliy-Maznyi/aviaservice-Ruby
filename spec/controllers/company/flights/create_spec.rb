describe Company::FlightsController do
  describe 'POST #create' do
    let!(:user) {create :user}
    let!(:company) {create :company, user: user}
    let(:plane) { create :plane }
    let!(:company_flights) {create :flight, company: company}

    before(:each) do
      sign_in user
    end

    def post_query(dest = '')
      post :create, flight: attributes_for(:flight, plane_id: plane.id, destination: dest)
    end

    context 'with valid attributes' do
      it 'creates a new flight' do
        expect{ post_query('Kiev') }.to change(Flight, :count).by(1)
      end

      it 'redirects to the company/flights index' do
        post_query('Kiev')
        expect(response).to redirect_to :action => :index
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new flight' do
        expect{ post_query }.to_not change(Flight, :count)
      end

      it 're-renders the new template' do
        post_query
        expect(response).to render_template :new
      end
    end
  end
end