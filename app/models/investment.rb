class Investment < ActiveRecord::Base
  validates :name, uniqueness: true
end
