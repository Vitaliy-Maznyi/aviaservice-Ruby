module ControllerHelpers
  def sign_in(user = double('user'))
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)
      allow(controller).to receive(:signed_in?).and_return(false)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
      allow(controller).to receive(:signed_in?).and_return(true)
    end
  end

  def login_admin
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = create(:admin)
      sign_in admin
  end


end