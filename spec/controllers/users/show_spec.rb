describe UsersController do
  context 'GET #show' do
    let!(:user_list) { create_list :user, 5 }
    let(:order_list) { create_list :order, 4, user: user_list[2] }

    before(:each) do
      sign_in user_list[2]
      get :show
    end

    it 'assigns user data to @user' do
      expect(assigns(:user)).to eq(user_list[2])
    end

    it 'renders the :show view' do
      expect(response).to render_template :show
    end

    it 'assigns current user orders array to @orders' do
      expect(assigns(:orders)).to match_array(order_list)
    end

  end
end