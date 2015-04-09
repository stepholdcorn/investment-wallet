require 'rails_helper'

feature 'tickers' do
  context 'no tickers have been added' do
    scenario 'displays a prompt to add a ticker' do
      visit '/investments'
      expect(page).to have_content 'Your wallet is empty'
      expect(page).to have_button 'Add ticker'
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
end