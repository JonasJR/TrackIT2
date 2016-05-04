# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

proposals = [
  { user_id: 1, name: 'Test', description: 'test', category: 'Thesis', course: 'DA339A', company: '', approved: false, vsc_url: '', project_managment_service: '' }
]

proposals.each do |name, population|
  Country.create( name: name, population: population )
end
