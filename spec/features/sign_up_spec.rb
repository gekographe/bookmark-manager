feature "User Sign Up" do

  scenario "user signs up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, cat@catmail.com!"
    expect(User.first.email).to eq('cat@catmail.com')
  end

  scenario "user signs up with a mismatching password" do
    expect { sign_up_fail }.to change(User, :count).by(0)
  end

end
