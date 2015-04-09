require 'rails_helper'

feature 'investments' do

  context 'no investments have been added' do
    scenario 'displays a prompt to add a ticker' do
      visit '/investments'
      expect(page).to have_content 'Your wallet is empty'
      expect(page).to have_link 'Add ticker'
    end
  end

  context 'investments have been added' do
    before { Investment.create name: 'AAPL' }

    scenario 'display investments' do
      visit '/investments'
      expect(page).to have_content 'AAPL'
      expect(page).not_to have_content 'Your wallet is empty'
    end
  end

  context 'adding an investment' do
    scenario 'prompts user to fill in a form, then displays the new ticker on the index page' do
      visit '/investments'
      click_link 'Add ticker'
      fill_in 'Name', with: 'AAPL'
      fill_in 'Quantity', with: '100'
      click_button 'Add'
      expect(page).to have_content 'AAPL 100'
      expect(current_path).to eq '/investments'
    end
  end

  context 'viewing individual investments' do
    let!(:aapl){ Investment.create(name: 'AAPL', quantity: '100') }

    scenario 'allows a user to view the investment in more detail' do
      visit '/investments'
      click_link 'AAPL'
      expect(page).to have_content 'Investment: AAPL Quantity: 100'
      expect(current_path).to eq "/investments/#{aapl.id}"
    end
  end

  context 'editing investments' do
    before { Investment.create(name: 'AAPL', quantity: '100') }

    scenario 'allows a user to edit an investment' do
      visit '/investments'
      click_link 'Edit'
      fill_in 'Quantity', with: '250'
      click_button 'Update'
      expect(page).to have_content 'AAPL 250'
      expect(current_path).to eq '/investments'
    end
  end

end