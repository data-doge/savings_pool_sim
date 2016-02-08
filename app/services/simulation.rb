class Simulation
  def self.run!
    pool = Pool.first
    pool.print_status

    pool.members.each do |member|
      puts "#{member.name} -- you have $#{member.balance} and #{member.points} points"
      puts "what would you like to do?"
      puts "-" * 20
      puts "[0] nothing"
      puts "[1] deposit"
      puts "[2] withdraw"
      choice = gets.chomp.to_i
      if choice == 1 || choice == 2
        puts "how much?"
        amount = gets.chomp.to_f
        case choice
          when 1 then member.deposit(amount)
          when 2 then member.withdraw(amount)
        end
      end
      puts "-" * 20; puts 
    end

    pool.members.each do |member|
      member.generate_balance_record!
    end

    pool.print_status
  end
end
