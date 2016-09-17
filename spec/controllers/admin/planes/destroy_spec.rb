describe Admin::PlanesController do
  context 'DELETE #destroy' do
    let(:company) { create :company}
    let!(:plane) { create :plane, company: company}

    before(:each) do
      login_admin
    end

    it 'deletes the plane' do
      expect{
        delete :destroy, id: plane.id, companyname: company.name
      }.to change(Plane,:count).by(-1)
    end

    it 'redirects to admin/planes#index' do
      delete :destroy, id: plane.id, companyname: company.name
      expect(response).to redirect_to :action => :index
    end

  end
end