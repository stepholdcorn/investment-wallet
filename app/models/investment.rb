class Investment < ActiveRecord::Base
  validates :name, uniqueness: true
  belongs_to :user

  def created_by?(user)
    self.user == user
  end
end


