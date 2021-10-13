# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

transx = Company.create(name: 'TransX', email: 'info@transx.com', description: 'A shipping company', phone_number: '1-800-123-4567') 
User.create(company: transx, name: 'admin', role: 'admin', email: 'admin@transx.com', password: '123456')
User.create(company: transx, name: 'driver', role: 'driver', email: 'driver@transx.com', password: '123456')