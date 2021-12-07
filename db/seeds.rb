puts "Cleaning database"
User.destroy_all
Project.destroy_all
Deliverable.destroy_all

puts "Creating main user"

User.create!({

  email: "testuser@gmail.com",
  password: "123456",
  username: "testuser",
  first_name: "Test",
  last_name: "User",
  account_type: "Creator",
  profile_pic: Faker::Company.logo
  })

20.times do
  Project.create!({
    user: User.last,
    name: Faker::Marketing.buzzwords,
    project_end: Faker::Date.between(from: '2021-12-12', to: '2022-02-12'),
    status: ['Pending', 'Saved', 'Ongoing', 'Completed'].sample,
    description: Faker::Company.bs,
    brand: Faker::Verb.base.capitalize + Faker::Commerce.brand
  })

    puts "Creating deliverables for #{Project.last.name}"

    3.times do
      Deliverable.create!({
        project: Project.last,
        deliverable_type: ["IG Post", "Tik Tok Video", "Photoshoot", "IG Story", "FB Post"].sample,
        due_date: Faker::Date.between(from: '2021-12-12', to: '2022-02-12'),
        description: Faker::Company.bs
      })

      3.times do
        new_draft = Draft.new({
          deliverable: Deliverable.last,
          attachment: Faker::Placeholdit.image(size: '50x50', format: 'jpg'),
          description: Faker::Company.bs,
          status: "pending"
        })
        new_draft.user = User.last
        new_draft.save!
      end
    end
end


puts "All done!"
