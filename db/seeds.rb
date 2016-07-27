# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#


Post.delete_all
Post.create(
  id: 1, 
  title: "First Post", 
  body: " There is no markdown here "
)





Post.create(
  id: 2, 
  title: "Second Post", 
  body: 
  %Q{
** Markdown header **
* My first post *
My second post *
My third post 
  }
)
