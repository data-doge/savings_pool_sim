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

  def generate_balance_record!
    balance_records.create(amount: points + balance, pool: pool)
  end

  def deposit(amount)
    deposits.create(pool: pool, amount: amount)
  end

  def withdraw(amount)
    withdrawals.create(pool: pool, amount: amount)
  end

  def print_status
    puts "#{name}:"
    puts "    balance: $#{balance}"
    puts "    points:  #{points}"
  end
end
