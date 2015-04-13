feature 'investments' do

  context 'no investments have been added' do
    xscenario 'displays a prompt to add a ticker' do
      user_sign_up('test@test.com', 'testtest', 'testtest')
      expect(page).to have_content 'Your wallet is empty'
      expect(page).to have_link 'Add ticker'
    end
  end

  context 'adding an investment' do
    xscenario 'prompts user to fill in a form, then displays the new ticker on the index page' do
      user_sign_up('test@test.com', 'testtest', 'testtest')
      add_investment('AAPL', 100)
      expect(page).to have_content 'Apple Inc.'
      expect(current_path).to eq '/investments'
    end
  end

  context 'an invalid investment' do
    xscenario 'a duplicate ticker displays an error' do
      user_sign_up('test@test.com', 'testtest', 'testtest')
      add_investment('AAPL', 100)
      add_investment('AAPL', 100)
      expect(page).to have_content 'error'
    end
  end

  context 'viewing individual investments' do
    xscenario 'allows a user to view the investment in more detail' do
      user_sign_up('test@test.com', 'testtest', 'testtest')
      add_investment('AAPL', 100)
      click_link 'Apple Inc.'
      expect(page).to have_content 'Apple Inc. AAPL NMS'
    end
  end

  context 'editing investments' do
    xscenario 'allows a user to edit an investment' do
      user_sign_up('test@test.com', 'testtest', 'testtest')
      add_investment('AAPL', 100)
      click_link 'Edit'
      fill_in 'Quantity', with: '250'
      click_button 'Update'
      click_link 'Apple Inc.'
      expect(page).to have_content '250'
    end
  end

  context 'deleting investments' do
    xscenario 'allows a user to delete an investment' do
      user_sign_up('test@test.com', 'testtest', 'testtest')
      add_investment('AAPL', 100)
      click_link 'Remove'
      expect(page).not_to have_content 'Apple Inc.'
      expect(page).to have_content 'Investment deleted successfully'
    end
  end

end