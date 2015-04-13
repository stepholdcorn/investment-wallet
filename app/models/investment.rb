class Investment < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :quantity
  belongs_to :user

  def created_by?(user)
    self.user == user
  end

  def quote
    quote = StockQuote::Stock.quote(self.name)
  end

end