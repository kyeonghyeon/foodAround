# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Inserting University data.."
[
    ["abc 대학교"],
    ["가나다 대학교"],
    ["훌륭한 대학교"],
    ["부실 대학교"]
    
].each do |x|
    University.create(name: x[0])     
end