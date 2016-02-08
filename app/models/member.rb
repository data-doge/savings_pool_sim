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

  def print_transaction_history
    puts "transaction history"
    puts "-" * 20
    ordered_transactions.each do |t|
      action = t.class == Deposit ? "deposited" : "withdrew"
      puts "#{action} $#{t.amount}"
    end
    puts "-" * 20; nil
  end

  def prompt_action
    puts "#{name} -- you have $#{balance} and #{points} points"
    puts "what would you like to do?"
    puts "-" * 20
    puts "[0] nothing"
    puts "[1] deposit"
    puts "[2] withdraw"
    puts "[3] show transaction history"
    case gets.chomp.to_i
      when 1 then prompt_transaction("deposit")
      when 2 then prompt_transaction("withdraw")
      when 3 then print_transaction_history
    end
    puts "-" * 20; puts
  end

  def prompt_transaction(type)
    puts "how much?"
    amount = gets.chomp.to_f
    type == "deposit" ? deposit(amount) : withdraw(amount)
  end

  def print_status
    puts "#{name}:"
    puts "    balance: $#{balance}"
    puts "    points:  #{points}"
  end

  private
    def ordered_transactions
      transactions = (deposits + withdrawals)
      transactions.sort_by { |t| t.created_at }
    end
end
