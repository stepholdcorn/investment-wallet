class Investment < ActiveRecord::Base
  validates :name, uniqueness: true
  belongs_to :user

  def created_by?(user)
    self.user == user
  end

  def quote
    quote = StockQuote::Stock.quote(self.name)
  end

end