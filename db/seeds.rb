# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

sports_names_list = [
    'Soccer',
    'Cricket',
    'Field Hockey',
    'Tennis',
    'Volleyball',
    'Table Tennis',
    'Basketball', 
    'Baseball',
    'Rugby',
    'Golf'
]

sports_names_list.each do |name|
    Sport.create(name: name)
end