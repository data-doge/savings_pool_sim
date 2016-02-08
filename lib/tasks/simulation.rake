desc "runs savings pool simulation"
task sim: :environment do
  pool = Pool.first
  pool.print_status

  # go through each member and ask:
    # would you like to withdraw or deposit?
      # how much?
  # end of the month, balance_record created for everyone
end
