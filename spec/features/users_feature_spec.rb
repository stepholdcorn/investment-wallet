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