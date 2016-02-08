Pool.destroy_all

# create a pool with five members
pool = Pool.create(name: "Savings Pool")
5.times { pool.members.create(name: Faker::Name.name) }

# create initial deposits for the pool
pool.members.each do |member|
  amount = rand(1..10) * 100
  Deposit.create(pool: pool, member: member, amount: amount)
end
