feature "User Sign Up" do

  scenario "user signs up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, cat@catmail.com!"
    expect(User.first.email).to eq('cat@catmail.com')
  end

  scenario "user signs up with a mismatching password" do
    expect { sign_up_fail(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page).to have_current_path('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario "user signs up without email address" do
    expect { sign_up_no_email }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "user can't sign up with an invalid email address" do
    expect { sign_up_fail(email: 'invalid@email')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "user can't sign up with an existing email address" do
    sign_up_fail
    expect { sign_up_fail }.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
  end
end
