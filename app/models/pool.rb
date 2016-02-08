class Pool < ActiveRecord::Base
  has_many :members, dependent: :destroy

  def balance
    members.map { |member| member.balance }.reduce(:+) || 0
  end

  def print_status
    puts "#{name}: $#{balance}"
    puts "-" * 20
    members.each { |member| member.print_status }
    puts "-" * 20
    puts
  end

  def generate_balance_records!
    members.each { |member| member.generate_balance_record! }
  end
end
