module SignInSupport
  def sign_in(user)
    
    visit root_path
    
    expect(page).to have_content('ログイン')

    visit new_user_session_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    
    click_on("Log in")
    
    expect(current_path).to eq root_path
  end
end