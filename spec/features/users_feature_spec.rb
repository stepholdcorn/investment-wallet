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
    add_investment('AAPL', 100)
    click_link 'Sign out'
    expect(page).not_to have_content 'Apple Inc.'
    expect(page).not_to have_link 'Edit'
    expect(page).not_to have_link 'Remove'
  end

  it 'does not allow a user to add a ticker' do
    visit '/'
    expect(page).not_to have_link 'Add ticker'
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

  it 'only displays the current user wallet' do
    add_investment('AAPL', 100)
    click_link 'Sign out'
    user_sign_up('anothertest@test.com', 'testtest', 'testtest')
    expect(page).not_to have_content 'Apple Inc.'
  end
end