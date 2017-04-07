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

def sign_up_fail
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: 'cat@catmail.com'
  fill_in :password, with: 'iwanttobealion!'
  fill_in :password_confirmation, with: 'idontwanttobealion!'
  click_button 'Sign up'
end
