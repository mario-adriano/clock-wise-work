# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Project.destroy_all
TimeLog.destroy_all

user = User.create(name: "Richard John Grayson", email: "richard-grayson@gmail.com", login: "nightwing", password: "BetteKane123" )
project = Project.create(title: "Blackest Night", description:"Green Lanterns Ash and Saarek find the Black Central")

ProjectUser.create(user_id: user.id, project_id: project.id)