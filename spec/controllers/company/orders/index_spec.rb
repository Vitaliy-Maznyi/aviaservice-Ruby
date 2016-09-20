describe Company::OrdersController do
  context 'GET #index' do
    let!(:user) { create :user}
    let!(:company) { create :company, user: user }
    let(:flight) { create :flight, company: company}
    let(:company_orders_list) { create_list :order, 3, flight: flight }

    before(:each) do
      sign_in user
      get :index
    end


    it 'fills an array of orders' do
      expect(assigns(:company_orders)).to match_array(company_orders_list)
    end

    it 'renders the :index view' do
      expect(response).to render_template :index
    end

  end
end