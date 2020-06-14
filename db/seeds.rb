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


event1 = Event.create(public: true, active: true, title: "Ice cream party", description: "This is an excellent event if you like sweets", location: "Brooklyn, NY", start: Time.new(2020,6,27,9), end: Time.new(2020,6,27,16))
event2 = Event.create(public: true, active: true, title: "Pair Programming", description: "How to pair program effectivly", location: "New York, NY", start: Time.new(2020,6,20,13), end: Time.new(2020,6,20,14))
event3 = Event.create(public: true, active: true, title: "Music Party 101", description: "Join us for a day filled with food and music", location: "Brooklyn, NY", start: Time.new(2020,6,21,10), end: Time.new(2020,6,21,18))
event4 = Event.create(public: false, active: true, title: "Block Party", description: "Let the neighbors get to know each other", location: "Edison, NJ", start: Time.new(2020,7,04,11), end: Time.new(2020,6,04,16))
event5 = Event.create(public: false, active: true, title: "Flatiron Mixer", description: "Let the students get to know each other", location: "Brooklyn, NY", start: Time.new(2020,7,10,12), end: Time.new(2020,6,10,13))
event6 = Event.create(public: true, active: true, title: "Coding Tornment", description: "This is a coding tonrment for bootcamp grads", location: "Brooklyn, NY", start: Time.new(2020,7,27,9), end: Time.new(2020,7,27,16))


EventUser.create(user_id: user1.id, event_id: event4.id, organizer: true)
EventUser.create(user_id: user1.id, event_id: event1.id, organizer: false)
EventUser.create(user_id: user1.id, event_id: event3.id, organizer: false)
EventUser.create(user_id: user2.id, event_id: event2.id, organizer: false)
EventUser.create(user_id: user2.id, event_id: event5.id, organizer: false)
EventUser.create(user_id: user2.id, event_id: event6.id, organizer: true)

DirectMessage.create(sender_id: user1.id, reciever_id: user2.id, message: "Hey Elisheva! From Bashir")
DirectMessage.create(sender_id: user1.id, reciever_id: user2.id, message: "Hey Elisheva! Second Message From Bashir!")
DirectMessage.create(sender_id: user2.id, reciever_id: user1.id, message: "Hey Bashir! From Elisheva")
DirectMessage.create(sender_id: user2.id, reciever_id: user1.id, message: "Hey Bashir! Second Message From Elisheva!")

GroupMessage.create(event_id: event1.id, user_id: user1.id, message: "Hello From Bashir to event with id #{event1.id}" )
GroupMessage.create(event_id: event1.id, user_id: user2.id, message: "Hello From Elisheva to event with id #{event1.id}" )
GroupMessage.create(event_id: event2.id, user_id: user1.id, message: "Hello From Bashir to event with id #{event2.id}" )
GroupMessage.create(event_id: event2.id, user_id: user2.id, message: "Hello From Elisheva to event with id #{event2.id}" )

puts "Seed Completed!"



