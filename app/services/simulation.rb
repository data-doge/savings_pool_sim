class Simulation
  def self.run!
    pool = Pool.first
    loop do
      pool.print_status
      pool.members.each { |member| member.prompt_action }
      pool.generate_balance_records!
      puts "press enter to advance month!"; gets
    end
  end
end
