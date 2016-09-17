describe Admin::PlanesController do
  let(:company) {create :company}
  let(:plane) {create :plane, company: company}
  let(:valid_attr) do
    { :number => 'new_number', econom_seats: 35 }
  end
  let(:invalid_attr) do
    { :number => '', econom_seats: 35 }
  end

  def put_update(attr)
    put :update, companyname: company.name, id: plane.id, plane: attr
    plane.reload
  end

  before(:each) do
    login_admin
  end

  context 'with invalid attributes' do
    it 're-renders the edit template' do
      put_update(invalid_attr)
      expect(response).to render_template :edit
    end

    it 'does not change values' do
      put_update(invalid_attr)
      expect(plane.number).not_to eq(invalid_attr[:number])
    end
  end

  context 'with valid attributes' do
    it 'redirects to index action' do
      put_update(valid_attr)
      expect(response).to redirect_to :action => :index
    end

    it 'updates values' do
      put_update(valid_attr)
      expect(plane.number).to eq(valid_attr[:number])
    end
  end
end