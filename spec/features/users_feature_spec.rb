context 'user not signed in and on the homepage' do
  it 'has sign in and sign up links' do
    visit '/'
    expect(page).to have_link 'Sign in'
    expect(page).to have_link 'Sign up'
  end

  it 'does not have a sign out link' do
    visit '/'
    expect(page).not_to have_link 'Sign out'
  end

  it 'does not display a wallet' do
    user_sign_up('test@test.com', 'testtest', 'testtest')
    visit '/'
    click_link 'Add ticker'
    fill_in 'Name', with: 'AAPL'
    fill_in 'Quantity', with: '100'
    click_button 'Add'
    click_link 'Sign out'
    expect(page).not_to have_content 'AAPL 100'
  end
end

context 'user signed in and on the homepage' do
  before { user_sign_up('test@test.com', 'testtest', 'testtest') }
  it 'has the sign out link' do
    visit '/'
    expect(page).to have_link 'Sign out'
  end

  it 'does not have sign in and sign up links' do
    visit '/'
    expect(page).not_to have_link 'Sign in'
    expect(page).not_to have_link 'Sign up'
  end
end