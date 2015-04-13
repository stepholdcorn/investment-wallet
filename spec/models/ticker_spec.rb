require 'spec_helper'

describe Investment, type: :model do 
  it 'is not valid unless a name and quantity is added' do
    investment = Investment.create
    expect(investment).to have(1).error_on(:quantity)
    expect(investment).to have(1).error_on(:name)
    expect(investment).not_to be_valid
  end
end