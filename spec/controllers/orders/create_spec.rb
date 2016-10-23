describe OrdersController do
  describe 'POST #create' do
    let(:user) { create :user }
    let(:flight) { create :flight }

    before(:each) do
      sign_in user
    end

    def post_query(number = 10000)
      post :create, flight_id: flight.id, order: attributes_for(:order, business_seats: number )
    end

    context 'with valid attributes' do
      it 'creates a new order' do
        expect{ post_query(10) }.to change(Order, :count).by(1)
      end

      it 'redirects to the root path' do
        post_query(10)
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new order' do
        expect{ post_query }.to_not change(Order, :count)
      end

      it 're-renders the new template' do
        post_query
        expect(response).to render_template :new
      end
    end
  end
end