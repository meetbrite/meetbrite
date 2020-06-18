# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Reseting database... "

Event.destroy_all 
User.destroy_all
EventUser.destroy_all
DirectMessage.destroy_all
GroupMessage.destroy_all


puts "Seeding database..."

user1 = User.create(first_name: "Bashir", last_name: "Alhanshali", email: "bashiralhanshali@yahoo.com", password: "hello", password_confirmation: "hello")
user2 = User.create(first_name: "Elisheva", last_name: "Elbaz", email: "elisheva@elbaz.com", password: "hello", password_confirmation: "hello")
user3 = User.create(first_name: "Bob", last_name: "Smith", email: "bob@smith.com", password: "hello", password_confirmation: "hello")
user4 = User.create(first_name: "Anita", last_name: "Gold", email: "anita@gold.com", password: "hello", password_confirmation: "hello")
user5 = User.create(first_name: "Jack", last_name: "Hilscher", email: "jack@hilscher.com", password: "hello", password_confirmation: "hello")




event1 = Event.create(public: true, active: true, title: "Ice cream party", description: "This is an excellent event if you like sweets", location_name: "Melt Bakery", street_address: "111 Front St", city: "Brooklyn", state: "NY", zipcode: "11201", start: Time.new(2020,6,27,9), end: Time.new(2020,6,27,16))
event2 = Event.create(public: true, active: true, title: "Pair Programming", description: "How to pair program effectively", virtual: true, start: Time.new(2020,6,20,13), end: Time.new(2020,6,20,14))
event3 = Event.create(public: true, active: true, title: "Music Party 101", description: "Join us for a day filled with food and music", city: "Brooklyn", state: "NY", start: Time.new(2020,6,21,10), end: Time.new(2020,6,21,18))
event4 = Event.create(public: false, active: true, title: "Block Party", description: "Let the neighbors get to know each other", street_address: "Campbell Avenue", city: "Edison", state: "NJ", zipcode: "08817", start: Time.new(2020,7,04,11), end: Time.new(2020,7,04,16))
event5 = Event.create(public: false, active: true, title: "Flatiron Mixer", description: "Let the students get to know each other", location_name: "Flatiron School", street_address: "81 Prospect St", city: "Brooklyn", state: "NY", zipcode: "11201", start: Time.new(2020,7,10,12), end: Time.new(2020,6,10,13))
event6 = Event.create(public: true, active: true, title: "Coding Tournament", description: "This is a coding tournament for bootcamp grads", location_name: "Flatiron School", street_address: "81 Prospect St", city: "Brooklyn", state: "NY", zipcode: "11201", start: Time.new(2020,7,27,9), end: Time.new(2020,7,27,16))
event7 = Event.create(public: true, active: true, title: "Car Show", description: "Come and see our newest cars ", location_name: "Edison Auto Sales", street_address: "195 US-1", city: "Edison", state: "NJ", zipcode: "08817", start: Time.new(2020,7,01,9), end: Time.new(2020,7,01,18))
event8 = Event.create(public: true, active: true, title: "Hackathon", description: "Show us what you can build in 24 hours!", location_name: "Flatiron School - Manhattan", street_address: "11 Broadway", city: "New York", state: "NY", zipcode: "10004", start: Time.new(2020,7,18,9), end: Time.new(2020,7,19,9))
event9 = Event.create(public: true, active: true, title: "Ice cream making", description: "Make homemade ice cream", street_address: "913 Seminary St", city: "Pennsburg", state: "PA", zipcode: "18073", start: Time.new(2020,6,25,10), end: Time.new(2020,6,25,12))


EventUser.create(user_id: user1.id, event_id: event4.id, organizer: true)
EventUser.create(user_id: user1.id, event_id: event1.id, organizer: true)
EventUser.create(user_id: user2.id, event_id: event1.id, organizer: false)
EventUser.create(user_id: user3.id, event_id: event1.id, organizer: false)
EventUser.create(user_id: user1.id, event_id: event3.id, organizer: false)
EventUser.create(user_id: user2.id, event_id: event2.id, organizer: false)
EventUser.create(user_id: user2.id, event_id: event5.id, organizer: true)
EventUser.create(user_id: user2.id, event_id: event6.id, organizer: true)
EventUser.create(user_id: user4.id, event_id: event7.id, organizer: true)
EventUser.create(user_id: user5.id, event_id: event8.id, organizer: true)
EventUser.create(user_id: user1.id, event_id: event8.id, organizer: false)
EventUser.create(user_id: user2.id, event_id: event8.id, organizer: false)
EventUser.create(user_id: user3.id, event_id: event9.id, organizer: true)


DirectMessage.create(sender_id: user1.id, receiver_id: user2.id, message: "Hey Elisheva!")
DirectMessage.create(sender_id: user2.id, receiver_id: user1.id, message: "Hey Bashir!")
DirectMessage.create(sender_id: user2.id, receiver_id: user1.id, message: "How's the project coming along?")
DirectMessage.create(sender_id: user1.id, receiver_id: user2.id, message: "Great! You should check it out!")

GroupMessage.create(event_id: event1.id, user_id: user1.id, message: "Hey everyone! What's your favorite ice cream flavor 🍦?" )
GroupMessage.create(event_id: event1.id, user_id: user3.id, message: "Chocolate! 🍫" )
GroupMessage.create(event_id: event1.id, user_id: user2.id, message: "Cookie Dough! 🍪" )
GroupMessage.create(event_id: event2.id, user_id: user1.id, message: "Can't wait for this event" )
GroupMessage.create(event_id: event2.id, user_id: user2.id, message: "Yeah I love pair programming" )

puts "Seed Completed!"



