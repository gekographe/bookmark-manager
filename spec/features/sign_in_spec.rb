feature "Sign in form" do

  scenario "user can sign in" do
    sign_up_fail
    visit '/users/sign_in'
    fill_in :email, with: 'alice@gmail.com'
    fill_in :password, with: '1234578'
    expect(page).to have_content "Congratulations, you signed in love"
  end
end
