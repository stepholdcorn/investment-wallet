require 'rails_helper'

feature 'tickers' do

  context 'no tickers have been added' do
    scenario 'displays a prompt to add a ticker' do
      visit '/investments'
      expect(page).to have_content 'Your wallet is empty'
      expect(page).to have_link 'Add ticker'
    end
  end

  context 'tickers have been added' do
    before do
      Investment.create(name: 'AAPL')
    end

    scenario 'display tickers' do
      visit '/investments'
      expect(page).to have_content 'AAPL'
      expect(page).not_to have_content 'Your wallet is empty'
    end
  end

  context 'adding a ticker' do
    scenario 'prompts user to fill in a form, then displays the new ticker' do
      visit '/investments'
      click_link 'Add ticker'
      fill_in 'Name', with: 'AAPL'
      fill_in 'Quantity', with: '100'
      click_button 'Add'
      expect(page).to have_content 'AAPL'
      expect(current_path).to eq '/investments'
    end
  end

end