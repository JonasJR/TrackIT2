# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# id, name, desc, category, course, company, approved, vsc_url, project_managment_service
proposals = [
  [4, 'Track IT', 'flksdajflsdkafjsad dsfkj adslkfjdsalkf dsf klds jfkldsfj klds jfkldsjf ldsa fjlkds f', 'Mah', '', '', false, '', '' ],
  [4, 'Skånetrafiken', 'App för att fixa nätverkstrafiken på skånetrafiken. ', '', '', '', false, '', '' ]
]

proposals.each do |id, name, desc, category, course, company, approved, vsc_url, project_managment_service|
  Proposal.create( user_id: id, name: name, description: desc, category: category, course: course, company: company, approved: approved, vsc_url: vsc_url, project_managment_service: project_managment_service )
end
