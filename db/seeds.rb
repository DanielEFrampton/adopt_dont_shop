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
                               image_path: "https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313_1280.jpg",
                               description: "Very canine",
                               adoptable: true
                             })
Shelter.find(1).pets.create({
                               name: "Phil",
                               approx_age: 1,
                               sex: "male",
                               image_path: "https://boygeniusreport.files.wordpress.com/2016/11/puppy-dog.jpg",
                               description: "Very canine",
                               adoptable: true
                             })
Shelter.find(2).pets.create({
                               name: "Jill",
                               approx_age: 5,
                               sex: "female",
                               image_path: "http://files.alfresco.mjh.group/alfresco_images/DVM360//2019/02/27/c23624de-1b4c-4e61-961f-db10dcf27341/veterinary-black-puppy-licking-wood-AdobeStock_211167675-450.jpg",
                               description: "Very canine",
                               adoptable: true
                             })
Shelter.find(2).pets.create({
                               name: "Will",
                               approx_age: 2,
                               sex: "male",
                               image_path: "https://image.cnbcfm.com/api/v1/image/105992231-1561667465295gettyimages-521697453.jpeg",
                               description: "Very canine",
                               adoptable: true
                             })
