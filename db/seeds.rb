puts "Cleaning database"
User.destroy_all
Project.destroy_all
Deliverable.destroy_all

puts "Creating brand and main user"

brand_user = User.create!({
  email: "brand@gmail.com",
  password: "123456",
  username: "myprotein",
  first_name: "my",
  last_name: "protein",
  account_type: "Brand",
  profile_pic: Faker::Company.logo(size: "20x20")
})

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
    status: ['pending', 'saved', 'ongoing', 'completed'].sample,
    description: Faker::Company.bs,
    brand: Faker::Verb.base.capitalize + Faker::Commerce.brand
  })

    puts "Creating deliverables for #{Project.last.name}"

    3.times do
      new_deliv = Deliverable.create!({
        project: Project.last,
        deliverable_type: ["IG Post", "Tik Tok Video", "Photoshoot", "IG Story", "FB Post"].sample,
        due_date: Faker::Date.between(from: '2021-12-12', to: '2022-02-12'),
        description: Faker::Company.bs
      })
      new_deliv.tag_list.add("photography, important", parse: true)
      new_deliv.save

      3.times do
        new_draft = Draft.new({
          deliverable: Deliverable.last,
          attachment: Faker::Placeholdit.image(format: 'jpg'),
          description: Faker::Company.bs,
          status: "pending"
        })
        new_draft.user = User.last
        new_draft.save!

        3.times do
          new_comment = Comment.new({
            user: brand_user,
            draft: new_draft,
            content: Faker::Company.bs
          })

          new_comment.save!
        end
      end
    end
end


puts "All done!"
