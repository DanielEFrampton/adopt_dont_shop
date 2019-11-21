# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shelter.create(name: "Ridiculous Test Name",
               address: "124 Fake Ln.",
               city: "Faketown",
               state: "FK",
               zip: "55555")
Shelter.create(name: "Even Worse Test Name",
               address: "45 Dumpster Fire Alley",
               city: "Faketown",
               state: "FK",
               zip: "55555")
Shelter.find(1).pets.create({
                               name: "Bill",
                               approx_age: 3,
                               sex: "male",
                               image_path: "image1.png",
                               description: "Very canine",
                               adoptable: true
                             })
Shelter.find(2).pets.create({
                               name: "Jill",
                               approx_age: 5,
                               sex: "female",
                               image_path: "image2.png",
                               description: "Very canine",
                               adoptable: true
                             })
Shelter.find(2).pets.create({
                               name: "Will",
                               approx_age: 2,
                               sex: "male",
                               image_path: "image3.png",
                               description: "Very canine",
                               adoptable: true
                             })
