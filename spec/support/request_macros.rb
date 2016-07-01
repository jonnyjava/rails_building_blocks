module RequestMacros
  def login_admin
    before(:each) do
      @current_user = FactoryGirl.create(:admin)
      post_via_redirect user_session_path,
                        'user[email]' => @current_user.email,
                        'user[password]' => @current_user.password
    end
  end

  def login_manager
    before(:each) do
      @current_user = FactoryGirl.create(:manager)
      post_via_redirect user_session_path,
                        'user[email]' => @current_user.email,
                        'user[password]' => @current_user.password
    end
  end

  def login_candidate
    before(:each) do
      @current_user = FactoryGirl.create(:candidate)
      post_via_redirect user_session_path,
                        'user[email]' => @current_user.email,
                        'user[password]' => @current_user.password
    end
  end
end
