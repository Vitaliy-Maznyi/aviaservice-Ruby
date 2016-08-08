describe Admin::FlightsController do
  describe "POST #create" do
    let(:company) {create :company, name: 'Air1'}
    let!(:admin_flights) {create :flight, company: company}

    before(:each) do
      login_admin
      flight_attributes = attributes_for(:flight)
      post :create, :companyname => 'Air1', flight: flight_attributes
    end

    context 'with valid attributes' do
      it 'creates a new flight' do
        expect(Flight.count).to eq(2)
      end

      it "redirects to the admin/flights index" do
        expect(response).to redirect_to :action => :index
      end
    end

    context "with invalid attributes" do
      it "does not save the new contact" do

      end

      it "re-renders the new method" do
        post :create, contact: Factory.attributes_for(:invalid_contact)
        response.should render_template :new
      end
    end
  end



end