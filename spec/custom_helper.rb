def user_sign_up(email, password, password_confirmation)
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end

def add_investment(ticker, quantity)
  visit '/'
  click_link 'Add ticker'
  fill_in 'Name', with: ticker
  fill_in 'Quantity', with: quantity
  click_button 'Add'
end