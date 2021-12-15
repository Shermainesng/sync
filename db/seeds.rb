puts "Cleaning database"
User.destroy_all
Project.destroy_all
Deliverable.destroy_all

puts "Creating brand and main user"

gv_user = User.create!({
  email: "brand1@gmail.com",
  password: "123456",
  username: "GoodVibesOnly",
  first_name: "Josh",
  last_name: "protein",
  account_type: "Brand",
  profile_pic: "https://media-exp1.licdn.com/dms/image/C560BAQFCE905w1ontQ/company-logo_200_200/0/1619769400393?e=2159024400&v=beta&t=XQCvNbVz_H2S1fSGnpe2pfbI25WWr2_ZOwzODNBk1BQ"
})

syn_user = User.create!({
  email: "brand2@gmail.com",
  password: "123456",
  username: "TheSyn",
  first_name: "Meryl",
  last_name: "protein",
  account_type: "Brand",
  profile_pic: "https://pbs.twimg.com/profile_images/1367579036390744069/apUbZjTe_400x400.jpg"
})

pl_user = User.create!({
  email: "brand3@gmail.com",
  password: "123456",
  username: "PinkLifestyle",
  first_name: "Dr Martha",
  last_name: "protein",
  account_type: "Brand",
  profile_pic: "https://pbs.twimg.com/profile_images/796310707050409984/u0femTwg_400x400.jpg"
})

User.create!({
  email: "testuser@gmail.com",
  password: "123456",
  username: "HELA",
  first_name: "Test",
  last_name: "User",
  account_type: "Creator",
  profile_pic: "https://imgur.com/fX4ENYV"
  })

#project 1
  goodvibesonly = Project.create!({
    user: User.last,
    name: "Pamper Yourself!",
    project_end: '2021-12-25',
    status: 'ongoing',
    description: "Good Vibes Only is launching a one-of-a-kind sex bomb! Need our help to advertise their product on our socials",
    brand_id: gv_user.id
  })
    puts "Creating deliverables for #{Project.last.name}"

    gv_deliv1 = Deliverable.create!({
      project: goodvibesonly,
      deliverable_type: "IG Post",
      due_date: '2021-12-20',
      description:"Create a post about self-care, and find a way to introduce the brand new sex bomb"
    })
    gv_deliv1.tag_list.add("urgent, advertisement", parse: true)
    gv_deliv1.save!

      gv_draft1 = Draft.new({
        deliverable: gv_deliv1,
        attachment: Faker::Placeholdit.image(format: 'jpg'),
        description: "A perfect gift for a friend/partner! Get 10% off by using promo code HELA. Limited stocks!!",
        status: "rejected"
      })
      gv_draft1.user = User.last

        gv_draft1_comment1 = Comment.new({
            user: gv_user,
            draft: gv_draft1,
            content: "Copy sounds good, but could you use a different image? You may use one of the photos we provided"
          })
          gv_draft1_comment1.save!

      gv_draft2 = Draft.new({
        deliverable: gv_deliv1,
        attachment: Faker::Placeholdit.image(format: 'jpg'),
        description: "A perfect gift for a friend/partner! Get 10% off by using promo code HELA. Limited stocks!!",
        status: "in progress"
      })
      gv_draft1.user = User.last

    gv_deliv2 = Deliverable.create!({
      project: goodvibesonly,
      deliverable_type: "Tiktok Vid",
      due_date: '2021-12-17',
      description:"10 seconds Tiktok vid that features the sex bomb in water. Use viral track"
    })
    gv_deliv2.tag_list.add("video, funny", parse: true)
    gv_deliv2.save!

#project 2
  polyamorous = Project.create!({
    user: User.last,
    name: "Polyamory #Unicorn",
    project_end: '2022-02-01',
    status: 'ongoing',
    description: "Promote Rachel Lark's about polyamory",
    brand_id: syn_user.id
  })
    puts "Creating deliverables for #{Project.last.name}"

    polyamorous_deliv1 = Deliverable.create!({
      project: polyamorous,
      deliverable_type: "Tiktok Vid",
      due_date: '2021-12-25',
      description:"Share interesting facts about unicorns in the poly community. Use Rachel Lark's unicorn song"
    })
    polyamorous_deliv1.tag_list.add("video, creative", parse: true)
    polyamorous_deliv1.save!
#project 3
  pinklifestyle = Project.create!({
    user: User.last,
    name: "Womanizer 2.0",
    project_end: '2021-01-20',
    status: 'ongoing',
    description: "Womanizer has launched its brand new vibe! Doing a soft launch on their socials",
    brand_id: pl_user.id
  })
  puts "Creating deliverables for #{Project.last.name}"

    pl_deliv1 = Deliverable.create!({
      project: pinklifestyle,
      deliverable_type: "IG Post",
      due_date: '2021-12-17',
      description:"Create a post that sells the product, and also encourage our followers to participate in our giveaway"
    })
    pl_deliv1.tag_list.add("photoshoot, giveaway", parse: true)
    pl_deliv1.save

      pl_draft1 = Draft.new({
        deliverable: pl_deliv1,
        attachment: Faker::Placeholdit.image(format: 'jpg'),
        description: "Thinking of trying something new? Why not give Womanizer 2.0 a try? Intense sensations promised",
        status: "rejected"
      })
      pl_draft1.user = User.last
      pl_draft1.save!

        pl_draft1_comment1 = Comment.new({
          user: pl_user,
          draft: pl_draft1,
          content: "Love the visuals, but could you change the copy? Angle it from a partner POV"
        })
        pl_draft1_comment1.save!

      pl_draft2 = Draft.new({
        deliverable: pl_deliv1,
        attachment: Faker::Placeholdit.image(format: 'jpg'),
        description: "Thinking of getting her jewellery for xmas? Shake things up!",
        status: "in progress"
      })
      pl_draft2.user = User.last
      pl_draft2.save!

    pl_deliv2 = Deliverable.create!({
      project: pinklifestyle,
      deliverable_type: "IG Story",
      due_date: '2021-12-20',
      description:"Create a story that sells the product, and also encourage our followers to participate in our giveaway"
    })
    pl_deliv2.tag_list.add("video, giveaway", parse: true)
    pl_deliv2.save


puts "All done!"
