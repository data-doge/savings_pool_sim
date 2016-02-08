class Member < ActiveRecord::Base
  belongs_to :pool
  has_many :balance_records, dependent: :destroy
  has_many :deposits, dependent: :destroy
  has_many :withdrawals, dependent: :destroy

  def balance
    deposits.sum(:amount) - withdrawals.sum(:amount)
  end
end
