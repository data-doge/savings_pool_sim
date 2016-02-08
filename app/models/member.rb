class Member < ActiveRecord::Base
  belongs_to :pool
  has_many :balance_records, dependent: :destroy
  has_many :deposits, dependent: :destroy
  has_many :withdrawals, dependent: :destroy

  def balance
    deposits.sum(:amount) - withdrawals.sum(:amount)
  end

  def points
    balance_records.any? ? balance_records.sum(:amount) : 0
  end

  def print_status
    puts "#{name}:"
    puts "    balance: $#{balance}"
    puts "    points:  #{points}"
  end
end
