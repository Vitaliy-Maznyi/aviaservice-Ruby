describe Admin::OrdersController do
  context 'GET #index' do
    let(:company) { create :company }
    let(:flight) { create :flight, company: company}
    let(:admin_orders_list) { create_list :order, 3, flight: flight }

    before(:each) do
      login_admin
      get :index, companyname: company.name
    end


    it 'fills an array of orders' do
      expect(assigns(:admin_orders)).to match_array(admin_orders_list)
    end

    it 'renders the :index view' do
      expect(response).to render_template :index
    end

  end
end