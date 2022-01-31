puts "Cleaning deliverables"
Deliverable.destroy_all
puts "Cleaning projects"
Project.destroy_all
puts "Cleaning users"
User.destroy_all
puts "Cleaning organizations"
Organisation.destroy_all
puts "Cleaning roles"
Role.destroy_all

puts "Creating organisations"

gv_organisation = Organisation.create!({
  name: "GoodVibesOnly"
})

syn_organisation = Organisation.create!({
  name: "TheSyn"
})

pl_organisation = Organisation.create!({
  name: "PinkLifestyle"
})

px_organisation = Organisation.create!({
  name: "Project X"
})

dame_organisation = Organisation.create!({
  name: "Dame"
})

lora_organisation = Organisation.create!({
  name: "LoraD"
})

hims_organisation = Organisation.create!({
  name: "hims&hers"
})

one_organisation = Organisation.create!({
  name: "ONE Condoms"
})

hela_organisation = Organisation.create!({
  name: "HELA"
})

puts "Creating users"

gv_user_1 = User.create!({
  email: "gv1@gmail.com",
  password: "123456",
  username: "gv1",
  first_name: "GoodVibesOnly1",
  last_name: "protein",
  organisation_id: gv_organisation.id,
  profile_pic: "https://media-exp1.licdn.com/dms/image/C560BAQFCE905w1ontQ/company-logo_200_200/0/1619769400393?e=2159024400&v=beta&t=XQCvNbVz_H2S1fSGnpe2pfbI25WWr2_ZOwzODNBk1BQ"
})
gv_user_2 = User.create!({
  email: "gv2@gmail.com",
  password: "123456",
  username: "gv2",
  first_name: "GoodVibesOnly2",
  last_name: "protein",
  organisation_id: gv_organisation.id,
  profile_pic: "https://media-exp1.licdn.com/dms/image/C560BAQFCE905w1ontQ/company-logo_200_200/0/1619769400393?e=2159024400&v=beta&t=XQCvNbVz_H2S1fSGnpe2pfbI25WWr2_ZOwzODNBk1BQ"
})

syn_user_1 = User.create!({
  email: "syn1@gmail.com",
  password: "123456",
  username: "syn1",
  first_name: "TheSyn1",
  last_name: "protein",
  organisation_id: syn_organisation.id,
  profile_pic: "https://pbs.twimg.com/profile_images/1367579036390744069/apUbZjTe_400x400.jpg"
})
syn_user_2 = User.create!({
  email: "syn2@gmail.com",
  password: "123456",
  username: "syn2",
  first_name: "TheSyn2",
  last_name: "protein",
  organisation_id: syn_organisation.id,
  profile_pic: "https://pbs.twimg.com/profile_images/1367579036390744069/apUbZjTe_400x400.jpg"
})

pl_user_1 = User.create!({
  email: "pl1@gmail.com",
  password: "123456",
  username: "pl1",
  first_name: "PinkLifestyle1",
  last_name: "protein",
  organisation_id: pl_organisation.id,
  profile_pic: "https://pbs.twimg.com/profile_images/796310707050409984/u0femTwg_400x400.jpg"
})

px_user_1 = User.create!({
  email: "px1@gmail.com",
  password: "123456",
  username: "px1",
  first_name: "Project X 1",
  last_name: "protein",
  organisation_id: px_organisation.id,
  profile_pic: "https://dcassetcdn.com/design_img/976333/489042/489042_5454366_976333_image.jpg"
})

dame_user_1 = User.create!({
  email: "dame1@gmail.com",
  password: "123456",
  username: "dame1",
  first_name: "Dame 1",
  last_name: "protein",
  organisation_id: dame_organisation.id,
  profile_pic: "data:image/png;base64,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"
})

lora_user_1 = User.create!({
  email: "lora1@gmail.com",
  password: "123456",
  username: "lora1",
  first_name: "LoraD 1",
  last_name: "protein",
  organisation_id: lora_organisation.id,
  profile_pic: "https://images.milledcdn.com/2020-10-30/FR4TOwDi6w2qAAQU/qIuuM3Z6lyxO.png"
})

hims_user_1 = User.create!({
  email: "hims1@gmail.com",
  password: "123456",
  username: "hims1",
  first_name: "hims&hers 1",
  last_name: "protein",
  organisation_id: hims_organisation.id,
  profile_pic: "data:image/png;base64,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"
})

one_user_1 = User.create!({
  email: "one1@gmail.com",
  password: "123456",
  username: "one1",
  first_name: "ONE Condoms",
  last_name: "protein",
  organisation_id: one_organisation.id,
  profile_pic: "https://cdn.shopify.com/s/files/1/1065/4262/files/checkout_logo_3_e6b29679-8a10-437b-a177-eaff910b7c84.png"
})

#main user
hela_user = User.create!({
  email: "testuser@gmail.com",
  password: "123456",
  username: "HELA",
  first_name: "Test",
  last_name: "User",
  organisation_id: hela_organisation.id,
  profile_pic: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAABaCAYAAABzAJLvAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAOxAAADsQBlSsOGwAABF1pVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0n77u/JyBpZD0nVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkJz8+Cjx4OnhtcG1ldGEgeG1sbnM6eD0nYWRvYmU6bnM6bWV0YS8nPgo8cmRmOlJERiB4bWxuczpyZGY9J2h0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMnPgoKIDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PScnCiAgeG1sbnM6QXR0cmliPSdodHRwOi8vbnMuYXR0cmlidXRpb24uY29tL2Fkcy8xLjAvJz4KICA8QXR0cmliOkFkcz4KICAgPHJkZjpTZXE+CiAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9J1Jlc291cmNlJz4KICAgICA8QXR0cmliOkNyZWF0ZWQ+MjAyMS0wOC0xNjwvQXR0cmliOkNyZWF0ZWQ+CiAgICAgPEF0dHJpYjpFeHRJZD4yYmE0YWU3My1hYTQ4LTRhOTgtYTUzOS0yZTBhYzYzNGI3Y2Y8L0F0dHJpYjpFeHRJZD4KICAgICA8QXR0cmliOkZiSWQ+NTI1MjY1OTE0MTc5NTgwPC9BdHRyaWI6RmJJZD4KICAgICA8QXR0cmliOlRvdWNoVHlwZT4yPC9BdHRyaWI6VG91Y2hUeXBlPgogICAgPC9yZGY6bGk+CiAgIDwvcmRmOlNlcT4KICA8L0F0dHJpYjpBZHM+CiA8L3JkZjpEZXNjcmlwdGlvbj4KCiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0nJwogIHhtbG5zOmRjPSdodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyc+CiAgPGRjOnRpdGxlPgogICA8cmRmOkFsdD4KICAgIDxyZGY6bGkgeG1sOmxhbmc9J3gtZGVmYXVsdCc+aGVsYTwvcmRmOmxpPgogICA8L3JkZjpBbHQ+CiAgPC9kYzp0aXRsZT4KIDwvcmRmOkRlc2NyaXB0aW9uPgoKIDxyZGY6RGVzY3JpcHRpb24g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"
})

puts "Creating projects"

#project 1
  goodvibesonly = Project.create!({
    user: hela_user,
    name: "Pamper Yourself!",
    project_end: '2021-12-25',
    status: 'ongoing',
    description: "Good Vibes Only is launching a one-of-a-kind sex bomb! Need our help to advertise their product on our socials",
    client_id: gv_organisation.id,
    users: [hela_user, gv_user_1, gv_user_2]
  })

 role1 = ProjectUser.find_by(user_id: hela_user.id, project_id: goodvibesonly.id)
 Role.create!({name: 'admin'})
 role1.role = Role.last
 role1.save!

 role2 = ProjectUser.find_by(user_id: gv_user_1.id, project_id: goodvibesonly.id)
 Role.create!({name: 'admin'})
 role2.role = Role.last
 role2.save!

 role3 = ProjectUser.find_by(user_id: gv_user_2.id, project_id: goodvibesonly.id)
 collaborator = Role.create!({name: 'collaborator'})
 role3.role = Role.last
 role3.save!

    puts "Creating deliverables for #{Project.last.name}"

    gv_deliv1 = Deliverable.create!({
      project: goodvibesonly,
      deliverable_type: "IG Post",
      due_date: '2021-12-17',
      description:"Create a post about self-care, and find a way to introduce the brand new sex bomb"
    })
    gv_deliv1.tag_list.add("urgent", parse: true)
    gv_deliv1.save!

      gv_draft1 = Draft.new({
          deliverable: gv_deliv1,
          description: "Good vibes, good life",
          status: "rejected"
        })
        gv_draft1.user = hela_user
        # gv_draft1.attachments << Faker::Placeholdit.image(format: 'jpg')
        gv_draft1.save!

          gv_draft1_comment1 = Comment.new({
            user: gv_user_1,
            draft: gv_draft1,
            content: "Love the visuals, but could you change the copy? Angle it from a partner POV"
          })
          gv_draft1_comment1.save!

        gv_draft2 = Draft.new({
          deliverable: gv_deliv1,
          description: "It's all about feeling good",
          status: "in progress"
        })
        gv_draft2.user = hela_user
        # gv_draft1.attachments << Faker::Placeholdit.image(format: 'jpg')
        gv_draft2.save!

    gv_deliv2 = Deliverable.create!({
      project: goodvibesonly,
      deliverable_type: "Tiktok Vid",
      due_date: '2021-12-24',
      description:"10 seconds Tiktok vid that features the sex bomb in water. Use viral track"
    })
    gv_deliv2.tag_list.add("video, funny", parse: true)
    gv_deliv2.save!

#project 2
  polyamorous = Project.create!({
    user: hela_user,
    name: "Polyamory #Unicorn",
    project_end: '2022-02-01',
    status: 'ongoing',
    description: "Promote Rachel Lark's song 'Unicorn', which takes a hilarious look at polyamory",
    client_id: syn_organisation.id,
    users: [hela_user, syn_user_1, syn_user_2]
  })

  role1 = ProjectUser.find_by(user_id: hela_user.id, project_id: polyamorous.id)
  Role.create!({name: 'admin'})
  role1.role = Role.last
  role1.save!

  role2 = ProjectUser.find_by(user_id: syn_user_1.id, project_id: polyamorous.id)
  Role.create!({name: 'admin'})
  role2.role = Role.last
  role2.save!

  role3 = ProjectUser.find_by(user_id: syn_user_2.id, project_id: polyamorous.id)
  collaborator = Role.create!({name: 'collaborator'})
  role3.role = Role.last
  role3.save!

    puts "Creating deliverables for #{Project.last.name}"

    polyamorous_deliv1 = Deliverable.create!({
      project: polyamorous,
      deliverable_type: "Tiktok Vid",
      due_date: '2021-12-25',
      description:"Share interesting facts about unicorns in the poly community. Use Rachel Lark's unicorn song"
    })
    polyamorous_deliv1.tag_list.add("video, creative", parse: true)
    polyamorous_deliv1.save!

    polyamorous_deliv2 = Deliverable.create!({
      project: polyamorous,
      deliverable_type: "Podcast ad",
      due_date: '2022-01-16',
      description:"Play Rachel's song in our podcast episode and mention her name"
    })
    polyamorous_deliv2.tag_list.add("promotion, podcast", parse: true)
    polyamorous_deliv2.save!

#project 3
  pinklifestyle = Project.create!({
    user: hela_user,
    name: "Womanizer 2.0",
    project_end: '2022-01-24',
    status: 'ongoing',
    description: "Womanizer has launched its brand new vibe! Doing a soft launch on their socials",
    client_id: pl_organisation.id,
    users: [pl_user_1]
  })

  role1 = ProjectUser.find_by(user_id: pl_user_1.id, project_id: pinklifestyle.id)
  Role.create!({name: 'admin'})
  role1.role = Role.last
  role1.save!

  puts "Creating deliverables for #{Project.last.name}"

    pl_deliv1 = Deliverable.create!({
      project: pinklifestyle,
      deliverable_type: "IG Post",
      due_date: '2021-12-19',
      description:"Create a post that sells the product, and also encourage our followers to participate in our giveaway"
    })
    pl_deliv1.tag_list.add("photoshoot, giveaway", parse: true)
    pl_deliv1.save!

      pl_draft1 = Draft.new({
        deliverable: pl_deliv1,
        description: "Thinking of trying something new? Why not give Womanizer 2.0 a try? Intense sensations promised",
        status: "rejected"
      })
      pl_draft1.user = hela_user
      # pl_draft1.attachments << Faker::Placeholdit.image(format: 'jpg')
      pl_draft1.save!

        pl_draft1_comment1 = Comment.new({
          user: pl_user_1,
          draft: pl_draft1,
          content: "Love the visuals, but could you change the copy? Angle it from a partner POV"
        })
        pl_draft1_comment1.save!

      pl_draft2 = Draft.new({
        deliverable: pl_deliv1,
        description: "Thinking of getting her jewellery for xmas? Shake things up!",
        status: "in progress"
      })
      pl_draft2.user = hela_user
      # pl_draft1.attachments << Faker::Placeholdit.image(format: 'jpg')
      pl_draft2.save!

    pl_deliv2 = Deliverable.create!({
      project: pinklifestyle,
      deliverable_type: "IG Story",
      due_date: '2021-12-20',
      description:"Create a story that sells the product, and also encourage our followers to participate in our giveaway"
    })
    pl_deliv2.tag_list.add("video, giveaway", parse: true)
    pl_deliv2.save!

#project 4
  projectx = Project.create!({
    user: hela_user,
    name: "Destigmatize",
    project_end: '2021-01-23',
    status: 'pending',
    description: "To spread awareness about the exploitation of sex workers",
    client_id: px_organisation.id,
    users: [px_user_1]
  })

  role1 = ProjectUser.find_by(user_id: px_user_1.id, project_id: projectx.id)
  Role.create!({name: 'admin'})
  role1.role = Role.last
  role1.save!

  puts "Creating deliverables for #{Project.last.name}"

    px_deliv1 = Deliverable.create!({
      project: projectx,
      deliverable_type: "IG Post",
      due_date: '2021-01-20',
      description:"Interview with a sex worker to get the inside scoop, and summarize the story in a post"
    })
    px_deliv1.tag_list.add("interview, storytelling", parse: true)
    px_deliv1.save

#project 5
  dame = Project.create!({
    user: hela_user,
    name: "Get in Touch w Yourself",
    project_end: '2022-02-20',
    status: 'ongoing',
    description: "Empowering young women to own their pleasures, and break the stigma that embracing pleasure is wrong",
    client_id: dame_organisation.id,
    users: [dame_user_1]
  })

  role1 = ProjectUser.find_by(user_id: dame_user_1.id, project_id: dame.id)
  Role.create!({name: 'admin'})
  role1.role = Role.last
  role1.save!

    dame_deliv1 = Deliverable.create!({
      project: dame,
      deliverable_type: "Youtube Video",
      due_date: '2021-12-28',
      description:"A youtube video that reviews some of Dame's products, in a Singaporean context."
    })
      dame_deliv1.tag_list.add("video, difficult", parse: true)
      dame_deliv1.save

    dame_deliv2 = Deliverable.create!({
      project: dame,
      deliverable_type: "Tiktok Vid",
      due_date: '2021-12-25',
      description:"A empowering video about how Singaporean women can take control of their own pleasure"
    })
      dame_deliv2.tag_list.add("creative,storytelling", parse: true)
      dame_deliv2.save

    dame_deliv3 = Deliverable.create!({
      project: dame,
      deliverable_type: "Blog Post",
      due_date: '2022-01-29',
      description:"An article of how Singaporeans can benefit from masturbating"
    })
    dame_deliv3.tag_list.add("writing,education", parse: true)
    dame_deliv3.save

#project 6
  lora = Project.create!({
    user: hela_user,
    name: "Bringing joy to SEA",
    project_end: '2022-02-20',
    status: 'ongoing',
    description: "Promote Lora's toys to SEA audiences, via our socials. Women's sexual empowerment and confidence.",
    client_id: lora_organisation.id,
    users: [lora_user_1]
  })

  role1 = ProjectUser.find_by(user_id: lora_user_1.id, project_id: lora.id)
  Role.create!({name: 'admin'})
  role1.role = Role.last
  role1.save!

    lora_deliv1 = Deliverable.create!({
      project: lora,
      deliverable_type: "Tiktok Vid",
      due_date: '2021-12-26',
      description:"A 10secs video about how Cara Delevigne has her own sex toy brand"
    })
      lora_deliv1.tag_list.add("advertisement", parse: true)
      lora_deliv1.save!

    lora_deliv2 = Deliverable.create!({
      project: lora,
      deliverable_type: "Blog Post",
      due_date: '2021-12-26',
      description:"Talk about how the founder has built her own empire"
    })
      lora_deliv2.tag_list.add("writing,storytelling", parse: true)
      lora_deliv2.save!

# project 7
  hims = Project.create!({
    user: hela_user,
    name: "Last longer and harder",
    project_end: '2022-01-15',
    status: 'ongoing',
    description: "Promote hims supplements for ED and PE, and how they can benefit men",
    client_id: hims_organisation.id,
    users: [hims_user_1]
  })

  role1 = ProjectUser.find_by(user_id: hims_user_1.id, project_id: hims.id)
  Role.create!({name: 'admin'})
  role1.role = Role.last
  role1.save!

    hims_deliv1 = Deliverable.create!({
      project: hims,
      deliverable_type: "Tiktok Vid",
      due_date: '2022-01-15',
      description:"A short and entertaining vid on how PE can ruin one's sex life"
    })
      hims_deliv1.tag_list.add("funny,video", parse: true)
      hims_deliv1.save!

    hims_deliv2 = Deliverable.create!({
      project: hims,
      deliverable_type: "Tiktok Vid",
      due_date: '2022-01-15',
      description:"A short and entertaining vid on how PE can ruin one's sex life"
    })
    hims_deliv2.tag_list.add("funny,video", parse: true)
    hims_deliv2.save!

puts "All done!"
