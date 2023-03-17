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


Stay.destroy_all
Invoice.destroy_all
Room.destroy_all
User.destroy_all

names = ["James Madison", "John Quincy Adams", "William Henry", "Zachary Taylor", "Millard Fillmore", "Franklin Pierce", "Mariam Crane", "Audrey Beck", "Elouise Thornton", "Suzanne Harrison", "Arun Allison", "Asad Lee", "Daniella Colon", "Findlay Copeland"]

# 14 users will created

p "Creating users ...."
names.sort.each do |n|
  u = User.create!(name: n)
  p "(#{u.id}) #{u.name}"
end
users = User.all
p "#{users.count} users created"



# Create 2 rooms for the first 10 users. Name: Owner initials + index"
users[1..10].each do |u|
  room_name = u.name.scan(/\b\w/).join
  number_of_rooms = 2
  number_of_rooms.times do |i|
    u.as_owner.create_room("#{room_name} - #{i+1}", 10.0 )
  end    
end
p "#{Room.all.count} rooms created"

# Guests will try check in
p "Check guest in....."
count = 0
rooms = Room.available
users.sort_by(&:name).each_with_index do |u,i|
  if rooms.any? && u.as_guest.check_in(rooms[i], Time.now - 20.minutes) 
    p "    #{u.name} checked in at #{rooms[i].name}"
    count += 1
  end
end
p "#{count} guests checked in and #{ Room.available.count} rooms available"

# Guest checking out
p "Check guests out the rooms..."
count = 0
Room.busy[1..10].each do |r|
  g = r.guest
  if g.check_out(Time.now - 10.minutes)
    p "   #{g.name} checked out at #{r.name}"
    count += 1 
  end
end

p "Guest will check again in....."
count = 0
rooms = Room.available
users.sort_by(&:name).each_with_index do |u,i|
  if rooms.any? && u.as_guest.check_in(rooms[i], Time.now - 5.minutes) 
    p "    #{u.name} checked in at #{rooms[i].name}"
    count += 1
  end
end
p "#{count} guests checked in and #{ Room.available.count} rooms available"


p "#{count} guests checked out"
p "#{Room.available.count} rooms available "
p "#{Room.busy.count} rooms busy "

# Generateing invoices
p "Creating invoices..."
Owner.all[1..2].each { |o| o.as_owner.create_invoices() }
p "#{Invoice.all.count} invoices created"
p "#{Stay.all.unbilled.count} unbilled stays"

#Results
p
p "Results"
Owner.all.sort_by(&:name).each do |o|
  p "id:#{o.id.to_s.rjust(2,"0")} - #{o.name.ljust(17)}  #{o.guests.count} guests #{o.rooms.available.count} rooms available  #{o.stays.unbilled.count} unbilled stays #{o.invoices.count} invoices"
end
