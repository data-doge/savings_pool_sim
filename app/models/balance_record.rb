class BalanceRecord < ActiveRecord::Base
  belongs_to :pool
  belongs_to :member
end
