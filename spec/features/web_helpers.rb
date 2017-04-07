def create_link_and_tag
  visit '/links/new'
  fill_in :title, with: "icanhazburgers"
  fill_in :url, with: "http://icanhas.cheezburger.com/cats"
  fill_in :tags, with: "curry Quentin"
  click_button "Save link"
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: 'cat@catmail.com'
  fill_in :password, with: 'iwanttobealion!'
  fill_in :password_confirmation, with: 'iwanttobealion!'
  click_button 'Sign up'
end

def sign_up_fail(email: 'alice@gmail.com',
                 password: '12345678',
                 password_confirmation: '12345678')
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_up_no_email(email: nil,
                 password: '12345678',
                 password_confirmation: '12345678')
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
