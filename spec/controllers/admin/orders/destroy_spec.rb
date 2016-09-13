describe Admin::OrdersController do
  context 'DELETE #destroy' do
    let(:company) { create :company}
    let!(:order) { create :order }

    before(:each) do
      login_admin
    end

    it 'deletes the flight' do
      expect{
        delete :destroy, id: order.id, companyname: company.name
      }.to change(Order,:count).by(-1)
    end

    it 'redirects to contacts#index' do
      delete :destroy, id: order.id, companyname: company.name
      expect(response).to redirect_to :action => :index
    end

  end
end