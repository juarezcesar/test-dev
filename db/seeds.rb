# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Invoice.destroy_all
Stay.destroy_all
Room.destroy_all
User.destroy_all

names = ["James Madison", "John Quincy Adams", "William Henry Harrison", "Zachary Taylor", "Millard Fillmore", "Franklin Pierce", "Mariam Crane", "Audrey Beck", "Elouise Thornton", "Suzanne Harrison", "Arun Allison", "Asad Lee", "Daniella Colon", "Findlay Copeland"]

# 14 users will created
users = User.create!(names.map{ |n| {name: n}})

p "#{users.count} users created"

# Create 3 rooms for the first 10 users
users[1..10].each do |u|
  room_name = u.name.scan(/\b\w/).join
  number_of_rooms = 3
  number_of_rooms.times do |i|
    u.as_owner.create_room("#{room_name} - #{i+1}", 10 )
  end    
end
p "#{Room.available.count} rooms created"

# Users will try check in
p "Users check into the rooms --------"

Room.available.each_with_index do |r,i|
  u = users.sample
  if u.as_guest.check_in(r) 
    p "#{u.name} checked in at #{r.name}"
  end
end

p "#{Room.busy.count} guest had checked in"

# User check out
Room.busy.each do |r|
    if rand(2) == 0
        u = r.guest
        if u.check_out(r) 
            p("#{u.name} checked out at #{r.name}") 
        end
    end
end

# p "Users checked out"
# p "Rooms busy: #{Room.busy.count}"

# p "------"

# p "Created #{User.count} users"
# p "Created #{Room.count} rooms"
# p "Created #{Stay.count} stays"
# p "Rooms available: #{Room.available.count}"
# p "Rooms busy: #{Room.busy.count}"