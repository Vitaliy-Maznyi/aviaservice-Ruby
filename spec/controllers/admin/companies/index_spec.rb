describe Admin::CompaniesController do

  context "GET #index" do
    let(:company) { create_list(:company, 4) }

    it "fills an array of companies" do
      login_admin
      get :index
      expect(assigns(:companies)).to match_array(company)
    end

    it "renders the :index view" do
      login_admin
      get :index
      expect(response).to render_template :index
    end

    it "redirects to sign in page if not admin" do
      sign_in
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
