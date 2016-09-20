describe Company::PlanesController do
  context 'DELETE #destroy' do
    let!(:user) { create :user}
    let!(:company) { create :company, user: user}
    let!(:plane) { create :plane, company: company}

    before(:each) do
      sign_in user
    end

    it 'deletes the plane' do
      expect{
        delete :destroy, id: plane.id
      }.to change(Plane,:count).by(-1)
    end

    it 'redirects to company/planes#index' do
      delete :destroy, id: plane.id
      expect(response).to redirect_to :action => :index
    end

  end
end