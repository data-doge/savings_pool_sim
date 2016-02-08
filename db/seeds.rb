Pool.destroy_all

pool = Pool.create(name: "Savings Pool")
3.times { pool.members.create(name: Faker::Name.name) }
