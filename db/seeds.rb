Pool.destroy_all

number_of_members = 3

pool = Pool.create(name: "Savings Pool")
number_of_members.times { pool.members.create(name: Faker::Name.name) }
