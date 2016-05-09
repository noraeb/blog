print "Seeding posts.."

Post.create( title: "The First Time", content: "The first time is always a bit weird and awkward. But it is a milestone :)" )
Post.create( title: "TDD", content: "It sounds like a tropical disease but it is so helpfull in creating a new application. Test Driven Development is one of the best ways to really understand what you're building." )
Post.create( title: "The thirtysomething dilemma", content: "When I decided I wanted to become a web developer and applied for a spot in the Codaisseur Academy all my friends said: it's your thirties dilemma! I hadn't realized it before but in only three months time I will turn 30. So were they right?" )
Post.create( title: "Git vomit", content: "When I first started the Codaisseur traineeship they briefly mentioned GitHub, as a place to collaborate with other people. The first time I actually used it was a nightmare. I had no idea what I was doing and I was scared of ruining other people's code. Merge to master? No Way!" )

puts "seeded #{Post.count} posts :)"
