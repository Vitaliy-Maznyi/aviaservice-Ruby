describe OrdersController do
  let(:user) { create :user }
  let(:flight) { create :flight}

  context "GET #new" do
    before(:each) do
      sign_in user
      get :new, flight_id: flight.id
    end

    it 'assigns a new order to @order' do
      expect(assigns(:order)).to be_a_new(Order)
    end
    it 'renders the :new template' do
      expect(response).to render_template :new
    end

  end
end