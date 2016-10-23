describe FlightsController do
  context 'GET #index' do
    let(:flights) { create_list(:flight, 4) }
    let(:flights_search) { create_list(:flight, 4, destination: 'Kiev')}


    before(:each) do
      get :index
    end

    context 'with search params' do
      it 'fills an array of flights with destination Kiev' do
        get :index, q: {destination_eq: 'Kiev'}
        expect(assigns(:flights)).to match_array(flights_search)
      end
    end

    context 'with all flights' do
      it 'fills an array of flights' do
        expect(assigns(:flights)).to match_array(flights)
      end

      it 'renders the :index view' do
        expect(response).to render_template :index
      end
    end
  end
end