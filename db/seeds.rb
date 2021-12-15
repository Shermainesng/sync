puts "Cleaning deliverables"
Deliverable.destroy_all
puts "Cleaning projects"
Project.destroy_all
puts "Cleaning users"
User.destroy_all

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
  profile_pic: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAABaCAYAAABzAJLvAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAOxAAADsQBlSsOGwAABF1pVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0n77u/JyBpZD0nVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkJz8+Cjx4OnhtcG1ldGEgeG1sbnM6eD0nYWRvYmU6bnM6bWV0YS8nPgo8cmRmOlJERiB4bWxuczpyZGY9J2h0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMnPgoKIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PScnCiAgeG1sbnM6QXR0cmliPSdodHRwOi8vbnMuYXR0cmlidXRpb24uY29tL2Fkcy8xLjAvJz4KICA8QXR0cmliOkFkcz4KICAgPHJkZjpTZXE+CiAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9J1Jlc291cmNlJz4KICAgICA8QXR0cmliOkNyZWF0ZWQ+MjAyMS0wOC0xNjwvQXR0cmliOkNyZWF0ZWQ+CiAgICAgPEF0dHJpYjpFeHRJZD4yYmE0YWU3My1hYTQ4LTRhOTgtYTUzOS0yZTBhYzYzNGI3Y2Y8L0F0dHJpYjpFeHRJZD4KICAgICA8QXR0cmliOkZiSWQ+NTI1MjY1OTE0MTc5NTgwPC9BdHRyaWI6RmJJZD4KICAgICA8QXR0cmliOlRvdWNoVHlwZT4yPC9BdHRyaWI6VG91Y2hUeXBlPgogICAgPC9yZGY6bGk+CiAgIDwvcmRmOlNlcT4KICA8L0F0dHJpYjpBZHM+CiA8L3JkZjpEZXNjcmlwdGlvbj4KCiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0nJwogIHhtbG5zOmRjPSdodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyc+CiAgPGRjOnRpdGxlPgogICA8cmRmOkFsdD4KICAgIDxyZGY6bGkgeG1sOmxhbmc9J3gtZGVmYXVsdCc+aGVsYTwvcmRmOmxpPgogICA8L3JkZjpBbHQ+CiAgPC9kYzp0aXRsZT4KIDwvcmRmOkRlc2NyaXB0aW9uPgoKIDxyZGY6RGVzY3JpcHRpb24g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"
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
    description: "Promote Rachel Lark's song about polyamory",
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
