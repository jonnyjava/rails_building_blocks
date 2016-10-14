module ControllerMacros
  def login_admin
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryGirl.create(:admin)
      sign_in user
    end
  end
end
