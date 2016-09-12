describe Admin::FlightsController do
  describe 'POST #create' do
    let(:company) {create :company, name: 'Air1'}
    let(:plane) { create :plane }
    let!(:admin_flights) {create :flight, company: company}

    before(:each) do
      login_admin
    end

    def post_query(dest = '')
      post :create, companyname: company.name, flight: attributes_for(:flight, company_id: company.id, plane_id: plane.id, destination: dest)
    end

    context 'with valid attributes' do
      it 'creates a new flight' do
        expect{ post_query('Kiev') }.to change(Flight, :count).by(1)
      end

      it 'redirects to the admin/flights index' do
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