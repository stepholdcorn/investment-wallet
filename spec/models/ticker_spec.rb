require 'spec_helper'

describe Investment, type: :model do 
  it 'is not valid unless it is unique' do
    Investment.create(name: 'AAPL')
    investment = Investment.new(name: 'AAPL')
    expect(investment).to have(1).error_on(:name)
    expect(investment).not_to be_valid
  end
end