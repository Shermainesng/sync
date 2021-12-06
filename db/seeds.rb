puts "Cleaning database"
User.destroy_all

puts "Creating brands"

10.times do
  User.create!({
    email: Faker::Internet.email,
    password: "123456",
    username: Faker::Commerce.brand + "#{rand(1..10)}",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    account_type: "brand",
    profile_pic: Faker::Company.logo
  })
  2.times do
    puts "Creating projects for #{User.last.username}"
    Project.create!({
      user: User.last,
      name: Faker::Marketing.buzzwords,
      project_end: Faker::Date.between(from: '2021-12-12', to: '2022-02-12'),
      status: ['Pending', 'Saved', 'Ongoing', 'Completed'].sample,
      description: Faker::Company.bs
    })
    3.times do
      puts "Creating deliverables for #{Project.last.name}"
      Deliverable.create!({
        project: Project.last,
        deliverable_type: ["IG Post", "Tik Tok Video", "Photoshoot", "IG Story", "FB Post"].sample,
        due_date: Faker::Date.between(from: '2021-12-12', to: '2022-02-12'),
        description: Faker::Company.bs
      })
    end
  end
end

puts "All done!"
