# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!([
                  {first_name: 'Alex', second_name: 'Roy', email: 'alexroy@gmail.com', password: '1234'},
                  {first_name: 'Ajay', second_name: 'Kumar', email: 'ajay123@gmail.com', password: 'kumar@1'},
                  {first_name: 'Oliver', second_name: 'Jones', email: 'oliverjones@gmail.com', password: 'oliver'}
                ])


Event.create!([
                {event_name: 'World tourism day', event_description: 'World tourism day', start_date_time: DateTime.parse("01/10/2022 12:00"), end_date_time: DateTime.parse("01/10/2022 14:00")},
                {event_name: 'Fall Destinations', event_description: 'Fall Destinations', start_date_time: DateTime.parse("05/10/2022 13:00"), end_date_time: DateTime.parse("05/10/2022 15:00")}
              ])

