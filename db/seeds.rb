# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(name: 'David Dogg', username: 'DDog33', encrypted_password: 'password1' , location: 'New York City', 
            department: 'sales', position: 'manager', active: true, aboutMe: 'dog lover, guitarist, writer')

User.create!(name: 'Carly Catt', username: 'CCatt44', encrypted_password: 'password2', location: 'New York City', 
            department: 'sales', position: 'representative', active: true, aboutMe: 'cat lover, painter, amateur cook')

User.create!(name: 'Freddy Fish', username: 'FFish44', encrypted_password: 'password3', location: 'San Fransisco',
             department: 'sales', position: 'manager', active: true, aboutMe:'runner, Harry Potter fan')

User.create!(name: 'Harry Hamster', username: 'HHam55', encrypted_password: 'password4', location: 'Los Angeles',
             department: 'sales', position: 'representative', active: true, aboutMe: 'vegan, yoga fanatic, ballroom dancer')
             
puts "#{User.count} users created!"

@user = User.create! (name: 'David Dogg', username: 'DDog33', encrypted_password: 'password1', location: 'New York City', 
                      department 'sales', position: 'manager', active: ‘true’, aboutMe: 'dog lover, guitarist, writer')
@post1 = @user.posts.build (projectTitle:'Fire Hydrant',  projectDesc 'Building FH app' imageUrl 'www.google.com') 
@post1.save   
puts "#{Post.count} posts created!"