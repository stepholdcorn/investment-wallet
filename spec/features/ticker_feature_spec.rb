feature 'investments' do

  context 'no investments have been added' do
    scenario 'displays a prompt to add a ticker' do
      user_sign_up('test@test.com', 'testtest', 'testtest')
      expect(page).to have_content 'Your wallet is empty'
      expect(page).to have_link 'Add ticker'
    end
  end

  context 'adding an investment' do
    scenario 'prompts user to fill in a form, then displays the new ticker on the index page' do
      user_sign_up('test@test.com', 'testtest', 'testtest')
      add_investment('AAPL', 100)
      expect(page).to have_content 'Apple Inc.'
      expect(current_path).to eq '/investments'
    end
  end

  context 'an invalid investment' do
    scenario 'empty fields display errors' do
      user_sign_up('test@test.com', 'testtest', 'testtest')
      add_investment('', '')
      expect(page).to have_content 'errors'
    end
  end

  context 'viewing individual investments' do
    scenario 'allows a user to view the investment in more detail' do
      user_sign_up('test@test.com', 'testtest', 'testtest')
      add_investment('AAPL', 100)
      click_link 'Apple Inc.'
      expect(page).to have_content 'Holding value:'
    end
  end

  context 'editing investments' do
    scenario 'allows a user to edit an investment from the home page' do
      user_sign_up('test@test.com', 'testtest', 'testtest')
      add_investment('AAPL', 100)
      click_link 'Edit'
      fill_in 'Quantity', with: '250'
      click_button 'Update'
      expect(page).to have_content '250'
    end

    scenario 'allows a user to edit an investment from the show page' do
      user_sign_up('test@test.com', 'testtest', 'testtest')
      add_investment('AAPL', 100)
      click_link 'Apple Inc.'
      click_link 'Edit units'
      fill_in 'Quantity', with: 250
      click_button 'Update'
      expect(page).to have_content '250'
    end
  end

  context 'deleting investments' do
    scenario 'allows a user to delete an investment' do
      user_sign_up('test@test.com', 'testtest', 'testtest')
      add_investment('AAPL', 100)
      click_link 'Remove'
      expect(page).not_to have_content 'Apple Inc.'
      expect(page).to have_content 'Investment deleted successfully'
    end
  end

end