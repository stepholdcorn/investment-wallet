require 'rails_helper'

feature 'tickers' do
  context 'no tickers have been added' do
    scenario 'displays a prompt to add a ticker' do
      visit '/investments'
      expect(page).to have_content 'Your wallet is empty'
      expect(page).to have_button 'Add ticker'
    end
  end
end