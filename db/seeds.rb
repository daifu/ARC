# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
address = Address.new(firstname: 'first', lastname: 'last', address1: '', address2: '', city: 'Los Angeles', zipcode: '90024')
address.state = State.first
address.country = Country.find_by_iso('US')
address.save
e = Event.new(name: 'Disaster Surge Response: Are We Ready Now?', start_at: Time.zone.parse('2012-12-04'), stop_at: Time.zone.parse('2012-12-04'), :eid => 'E12042012')
e.address = address
e.save